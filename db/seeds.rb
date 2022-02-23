# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザ側seed
  12.times do |n|
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
      account_name: "てらるる.#{n+1}"
    )
  end


# 管理者側seed
  Admin.create!(
    email: "admin@pf.pf",
    password: "testpf"
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
  User.limit(3).each do |user|
    CSV.foreach('lib/article_db_ver1.csv') do |row|
      user.articles.create!(
        cultivar_name: row[0],
        prefecture_id: row[1],
        municipality_id: row[2],
        level: row[3],
        category: row[4],
        season_ids: row[5],
        fertilizer_existence: row[6],
        fertilizer_info: row[7],
        place: row[8],
        condition: row[9],
        state_at_start: row[10],
        tag_list: row[11],
        is_visible: [true, false].sample
      )
    end
  end

  User.limit(3).offset(3).each do |user|
    CSV.foreach('lib/article_db_ver2.csv') do |row|
      user.articles.create!(
        cultivar_name: row[0],
        prefecture_id: row[1],
        municipality_id: row[2],
        level: row[3],
        category: row[4],
        season_ids: row[5],
        fertilizer_existence: row[6],
        fertilizer_info: row[7],
        place: row[8],
        condition: row[9],
        state_at_start: row[10],
        tag_list: row[11],
        is_visible: [true, false].sample
      )
    end
  end

  User.limit(3).offset(6).each do |user|
    CSV.foreach('lib/article_db_ver3.csv') do |row|
      user.articles.create!(
        cultivar_name: row[0],
        prefecture_id: row[1],
        municipality_id: row[2],
        level: row[3],
        category: row[4],
        season_ids: row[5],
        fertilizer_existence: row[6],
        fertilizer_info: row[7],
        place: row[8],
        condition: row[9],
        state_at_start: row[10],
        tag_list: row[11],
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
