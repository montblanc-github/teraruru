require "refile/file_double"

FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number: 5) }
    first_name { Faker::Lorem.characters(number: 5) }
    last_name_kana { Faker::Lorem.characters(number: 5) }
    first_name_kana { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    post_code { Faker::Number.number(digits: 7) }
    address { Faker::Address.full_address }
    account_name { Faker::Lorem.characters(number: 5) }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }

    after(:build) do |user|
      user.profile_image = Refile::FileDouble.new("dummy", "profile_image.jpeg", content_type: "image/jpeg")
    end
  end
end
