class Municipality < ApplicationRecord
  # アソシエーション
  belongs_to :prefecture
  has_many :articles

  # バリデーション
  validates :municipality_name, presence: true
end
