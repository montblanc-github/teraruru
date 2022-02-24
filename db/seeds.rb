# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザ側seed
  20.times do |n|
    test_user = Gimei.name
    address = Gimei.address
    User.create!(
      last_name: test_user.last.kanji,
      first_name: test_user.first.kanji,
      last_name_kana: test_user.last.katakana,
      first_name_kana: test_user.first.katakana,
      email: "#{n+1}tanaka@test.test",
      password: "123456",
      post_code: "1234567",
      address: address.kanji,
      account_name: "t.t#{n+1}"
    )
  end


# 管理者側seed
  Admin.create!(
    email: "test@test.test",
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


# 時期seed
  12.times do |n|
    Season.create!(
      month: "#{n+1}月"
    )
  end

# 投稿seed
  User.all.each do |user|
    20.times do |num|
      test_category = ["vegetable", "fruit", "plant", "flower"]
      test_place = ["indoor", "outdoor", "veranda"]
      test_condition = ["pot", "ground", "greenhouse"]
      test_state = ["seed", "seedling", "bulb"]
      user.articles.create!(
        cultivar_name: "test#{num}",
        prefecture_id: 1,
        municipality_id: rand(1..10),
        level: rand(1..5),
        category: test_category.sample,
        season_ids: "1",
        fertilizer_existence: false,
        place: test_place.sample,
        condition: test_condition.sample,
        state_at_start: test_state.sample,
        is_visible: [true, false].sample
      )
    end
  end

# フォローseed
  users = User.all
  user  = users.first
  following = users.limit(9).offset(1)
  followers = users.limit(15).offset(2)
  following.each { |val| user.follow(val.id) }
  followers.each { |f| f.follow(user.id) }

# いいねseed
  Article.limit(10).each do |article|
  　users = User.limit(10)
  　users.each {|user| user.favorite(article)}
  end