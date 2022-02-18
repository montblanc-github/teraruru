class Article < ApplicationRecord
  # refile読み込み
  attachment :article_image

  # acts-as-taggable-on読み込み
  acts_as_taggable_on :tags

  # 閲覧数impressionist読み込み
  is_impressionable counter_cache: true

  # アソシエーション
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :notification, dependent: :destroy

  # バリデーション
    # 品種名の文字数制限は、アマモの名称「リュウグウノオトヒメノモトユイノキリハズシ」から決定。
  validates :cultivar_name, presence: true, length: {maximum: 21}
  validates :prefecture_id, presence: true
  validates :municipality_id, presence: true
  validates :level , presence: true
  validates :category, presence: true
  validates :season, presence: true
    # boolean型は、falseの時にエラーが返る状態にならないよう、presenceは使わない。
  validates :fertilizer_existence, inclusion: {in: [true, false]}
  validates :fertilizer_info, length: {maximum: 100}
  validates :fertilizer_info, presence: true, if: :fertilizer_existence?
  validates :place, presence: true
  validates :condition, presence: true
  validates :state_at_start, presence: true
  validate :validate_tag

  # いいねランキング
  def self.extract_favorite_ranking_articles
    Article.where(is_visible: true).joins(:favorites).group(:article_id).order(Arel.sql('count(article_id) desc'))
  end

  # 検索
  def self.search(is_current_admin, keyword)
    if is_current_admin
      Article.where( "(cultivar_name LIKE?) OR (prefecture_id = ?)", "%#{keyword}%", "#{keyword}")
    else
      Article.where(is_visible: true).where( "(cultivar_name LIKE?) OR (prefecture_id = ?)", "%#{keyword}%", "#{keyword}")
    end
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

  private

  TAG_MAX_COUNT = 10
  def validate_tag
    if tag_list.size > TAG_MAX_COUNT
      return errors.add(:tag_list, :too_many_tags, message: "は#{TAG_MAX_COUNT}個以下にしてください")
    end

    tag_list.each do |tag_name|
      tag = Tag.new(name: tag_name)
      tag.validate_name
      tag.errors.messages[:name].each { |message| errors.add(:tag_list, message) }
    end
  end

end
