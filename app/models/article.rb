class Article < ApplicationRecord
  # refile読み込み
  attachment :article_image

  # acts-as-taggable-on読み込み
  acts_as_taggable_on :tags

  # 閲覧数impressionist読み込み
  is_impressionable counter_cache: true

  # アソシエーション
  belongs_to :user
  belongs_to :prefecture
  belongs_to :municipality
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :notification, dependent: :destroy

  # バリデーション
  validates :cultivar_name, presence: true
  validates :prefecture_id, presence: true
  validates :municipality_id, presence: true
  validates :level , presence: true
  validates :category, presence: true
  validates :season, presence: true
  validates :fertilizer_existence, presence: true
  validates :place, presence: true
  validates :condition, presence: true
  validates :state_at_start, presence: true
  validates :is_delete, presence: true

  # 検索
  def self.search(keyword)
    return Article.all unless keyword
    Article.where("(cultivar_name LIKE?) OR (prefecture_id = ?)", "%#{keyword}%", "#{keyword}")
  end

  # 通知
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      article_id: id,
      visited_id: user_id,
      action: "favorite"
    )
    notification.save if notification.valid?
  end

  def create_notification_hidden!
    notification = Notification.new(
      article_id: id,
      visited_id: user_id,
      admin_id: 1,
      action: "hidden"
    )
    notification.save
  end

  def create_notification_delete!
    notification = Notification.new(
      article_id: id,
      visited_id: user_id,
      admin_id: 1,
      action: "delete"
    )
    notification.save
  end

  def create_notification_comment!(current_user, comment_id, visited_id)
    unless current_user.id == visited_id
      notification = current_user.active_notifications.new(
        article_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
      )
    end
    notification.save if notification.valid?
  end
end
