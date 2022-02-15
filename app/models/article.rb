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

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(article_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      article_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
