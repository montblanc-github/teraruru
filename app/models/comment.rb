class Comment < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :article

  # バリデーション
  validates :content, presence: true, length: {maximum: 150}

end
