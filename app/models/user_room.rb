class UserRoom < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :room

  # バリデーション
  validates :user_id, presence: true
  validates :room_id, presence: true
end
