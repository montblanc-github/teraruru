require "refile/file_double"

FactoryBot.define do
  factory :article do
    cultivar_name { Faker::Lorem.characters(number: 5) }
    prefecture_id { '1' }
    municipality_id { '1' }
    level { '3' }
    category { 'plant' }
    season_ids { '1' }
    fertilizer_existence { 'あり' }
    fertilizer_info { Faker::Lorem.characters(number: 15) }
    place { 'indoor' }
    condition { 'pot' }
    state_at_start { 'seed' }
    message { Faker::Lorem.characters(number: 30) }

    after(:build) do |article|
      article.article_image = Refile::FileDouble.new("dummy", "article_image.jpeg", content_type: "image/jpeg")
    end
  end
end
