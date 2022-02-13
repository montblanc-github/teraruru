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
    self.last_name + " " + self.first_name
  end

  def full_name_kana
    self.last_name_kana + " " + self.first_name_kana
  end

  # 郵便番号
  def post_code_add_mark
    "〒" + self.post_code.to_s.insert(3, "-")
  end

  private

  # idをuuidに変更。
  def set_uuid
    while id.blank? || User.find_by(id: id).present?
      self.id = SecureRandom.uuid
    end
  end
end
