class Municipality < ApplicationRecord

  # アソシエーション
  belongs_to :prefecture

  # バリデーション
  validates :municipality_name, presence: true

end
