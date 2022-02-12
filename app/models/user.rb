class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # refile読み込み
  attachment :profile_image

  # アソシエーション
  has_many :articles, dependent: :destroy

  # idを生成する前にset_uuidを呼び出す。
  before_create :set_uuid

  # uuidを用いると、id順の取得が困難になるため、作成日で並ぶよう変更。
  default_scope -> { order(created_at: :desc) }

  private

  # idをuuidに変更。
  def set_uuid
    while id.blank? || User.find_by(id: id).present?
      self.id = SecureRandom.uuid
    end
  end
end
