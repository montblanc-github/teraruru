# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザ側seed
  20.times do |n|
    User.create!(
      last_name: "田中",
      first_name: "太郎#{n+1}",
      last_name_kana: "タナカ",
      first_name_kana: "タロウ#{n+1}",
      email: "#{n+1}tanaka@test",
      password: "123456",
      post_code: "1234567",
      address: "東京都中央区20‐20-#{n+1}00",
      account_name: "t.t#{n+1}"
    )
  end


# 管理者側seed
  Admin.create!(
    email: "test@test",
    password: "123456"
    )


# 都道府県・市区町村CSV読み込み
  require "csv"

  CSV.foreach('lib/都道府県リスト.csv') do |row|
    Prefecture.create!(name: row[0])
  end

  CSV.foreach('lib/市区町村リスト.csv') do |row|
    Municipality.create!(prefecture_id: row[0], municipality_name: row[1])
  end

# 投稿seed
  User.all.each do |user|
    20.times do |num|
      test_category = ["vegetable", "fruit", "plant", "flower"]
      test_season = ["spring", "summer", "autumn", "winter"]
      test_place = ["indoor", "outdoor", "veranda"]
      test_condition = ["pot", "ground", "greenhouse"]
      test_state = ["seed", "seedling", "bulb"]
      user.articles.create!(
        cultivar_name: "test#{num}",
        prefecture_id: 1,
        municipality_id: rand(1..10),
        level: rand(1..5),
        category: test_category.sample,
        season: test_season.sample,
        fertilizer_existence: false,
        place: test_place.sample,
        condition: test_condition.sample,
        state_at_start: test_state.sample
      )
    end
  end
