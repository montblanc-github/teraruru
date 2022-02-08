class Prefecture < ApplicationRecord

  # アソシエーション
  has_many :municipalities

  # バリデーション
  validates :name, presence: true, uniquness: true

end
