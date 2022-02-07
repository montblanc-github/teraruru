class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # adminの新規作成ができないよう指定。
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


  #idを生成する前にset_uuidを呼び出す。
  before_create :set_uuid

  private

  # idをuuidに変更。
  def set_uuid
    while self.id.blank? || User.find_by(id: self.id).present? do
      self.id = SecureRandom.uuid
    end
  end

end
