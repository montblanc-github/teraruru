class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 正規表現
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze
  VALID_KANA_REGEX = /\A[ァ-ヴー－]+\z/.freeze
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze
  VALID_POST_CODE_REGEX = /\A\d{7}\z/.freeze
end
