require "refile/file_double"

FactoryBot.define do
  factory :article do
    cultivar_name { Faker::Lorem.characters(number: 5) }
    prefecture_id { '1' }
    municipality_id { '1' }
    level { Faker::Number.between(from: 1, to: 5) }
    category { 'plant' }
    season { 'spring' }
    fertilizer_existence { Faker::Boolean.boolean }
    fertilizer_info { Faker::Lorem.characters(number: 15) }
    place { 'indoor' }
    condition { 'pot' }
    state_at_start { 'seed' }
    message { Faker::Lorem.characters(number: 30) }
    tag_list { Faker::Lorem.characters(number: 5) }

    after(:build) do |article|
      article.article_image = Refile::FileDouble.new("dummy", "article_image.jpeg", content_type: "image/jpeg")
    end
  end
end
