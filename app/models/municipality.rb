class Municipality < ApplicationRecord

  # アソシエーション
  belongs_to :prefecture

  # バリデーション
  validates :name, presence: true

end
