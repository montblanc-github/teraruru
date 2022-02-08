class Article < ApplicationRecord

  # refile読み込み
  attachment :article_image

  # アソシエーション
  belongs_to :user
end
