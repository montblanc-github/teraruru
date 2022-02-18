FactoryBot.define do
  factory :municipality do
    municipality_name { Faker::Lorem.characters(number: 3) }
  end
end
