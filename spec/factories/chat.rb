FactoryBot.define do
  factory :chat do
    content { Faker::Lorem.characters(number: 30) }
  end
end