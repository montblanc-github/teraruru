class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #idを生成する前にset_uuidを呼び出す。
  before_create :set_uuid

  # uuidを用いると、id順の取得が困難になるため、作成日で並ぶよう変更。
  default_scope -> { order(created_at: :desc) }

  private

  # idをuuidに変更。
  def set_uuid
    while self.id.blank? || User.find_by(id: self.id).present? do
      self.id = SecureRandom.uuid
    end
  end

end
