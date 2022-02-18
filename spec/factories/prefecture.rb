FactoryBot.define do
  factory :prefecture do
    name { Faker::Lorem.characters(number: 3) }
  end
end