require "refile/file_double"

FactoryBot.define do
  factory :user do
    test_user = Gimei.name
    last_name { test_user.last.kanji }
    first_name { test_user.first.kanji }
    last_name_kana { test_user.last.katakana }
    first_name_kana { test_user.first.katakana }
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
