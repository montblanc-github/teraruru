class Article < ApplicationRecord

  # refile読み込み
  attachment :article_image

  # アソシエーション
  belongs_to :user
  belongs_to :prefecture
  belongs_to :municipality
end
