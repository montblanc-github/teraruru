class Chat < ApplicationRecord
  # アソシエーション
  belongs_to :room
  belongs_to :user

  # バリデーション追加
  validates :content, presence: true, length: { maximum: 150 }
end
