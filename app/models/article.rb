class Article < ApplicationRecord

  # refile読み込み
  attachment :article_image

  # acts-as-taggable-on読み込み
  acts_as_taggable_on :tags

  # アソシエーション
  belongs_to :user
  belongs_to :prefecture
  belongs_to :municipality

  # 検索
  def self.search(keyword)
    return Article.all unless keyword
    Article.where("(cultivar_name LIKE?) OR (prefecture_id = ?)","%#{keyword}%","#{keyword}")
  end
end
