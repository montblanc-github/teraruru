class Notification < ApplicationRecord

    # アソシエーション
    belongs_to :article, optional: true
    belongs_to :comment, optional: true
    belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
    belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

    # バリデーション
    validates :visited_id, presence: true
    validates :action, presence: true

end
