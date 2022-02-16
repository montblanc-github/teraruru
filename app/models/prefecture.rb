class Prefecture < ApplicationRecord
  # アソシエーション
  has_many :municipalities
  has_many :articles

  # バリデーション
  validates :name, presence: true
end
