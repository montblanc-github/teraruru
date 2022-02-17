class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # adminの新規作成ができないよう指定。
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # idを生成する前にset_uuidを呼び出す。
  before_create :set_uuid

  # バリデーション
  validates :email, { presence: true,
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: true }

  private

  # idをuuidに変更。
  def set_uuid
    while id.blank? || User.find_by(id: id).present?
      self.id = SecureRandom.uuid
    end
  end
end
