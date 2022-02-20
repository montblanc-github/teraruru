class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 正規表現
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA_REGEX = /\A[ァ-ヴー－]+\z/
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  VALID_POST_CODE_REGEX = /\A\d{7}\z/

end
