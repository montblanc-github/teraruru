class Favorite < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :article

  # バリデーション
  validates :user_id, presence: true
  validates :article_id, presence: true
end
