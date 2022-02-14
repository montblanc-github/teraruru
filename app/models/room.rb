class Room < ApplicationRecord
  # アソシエーション
  has_many :user_rooms
  has_many :chats
end
