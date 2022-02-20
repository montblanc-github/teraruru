class Season < ApplicationRecord

  # アソシエーション
  has_many :article_seasons
  has_many :articles, through: :article_seasons

end
