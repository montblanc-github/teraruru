class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # refile読み込み
  attachment :profile_image

  # アソシエーション
  has_many :articles, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :comments, dependent: :destroy
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # バリデーション
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
  validates :address, presence: true

  # idを生成する前にset_uuidを呼び出す。
  before_create :set_uuid

  # uuidを用いると、id順の取得が困難になるため、作成日で並ぶよう変更。
  default_scope -> { order(created_at: :desc) }

  # フォロー フォロワー機能
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  # フルネーム
  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end

  # 郵便番号
  def post_code_add_mark
    "〒" + post_code.to_s.insert(3, "-")
  end

  # いいね機能
  def favorite(article)
    favorites.find_or_create_by(article: article)
  end

  def favorite?(article)
    favorite_articles.include?(article)
  end

  def unfavorite(article)
    favorite_articles.delete(article)
  end

  # 通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(account_name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.last_name = "竜宮の乙姫の"
      user.first_name = "元結の切外し"
      user.last_name_kana = "リュウグウノオトヒメノ"
      user.first_name_kana = "モトユイノキリハズシ"
      user.password = SecureRandom.urlsafe_base64
      user.post_code = "1234567"
      user.address = "東京都中央区てらるるビル10階-1"
      user.account_name = "guestuser"
    end
  end

  private

  # idをuuidに変更。
  def set_uuid
    while id.blank? || User.find_by(id: id).present?
      self.id = SecureRandom.uuid
    end
  end
end
