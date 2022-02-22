class ArticleSeason < ApplicationRecord
  # アソシエーション
  belongs_to :article
  belongs_to :season
end
