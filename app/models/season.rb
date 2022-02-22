class Season < ApplicationRecord
  # アソシエーション
  has_many :article_seasons
  has_many :articles, through: :article_seasons

  # バリデーション
  validates :month, presence: true
end
