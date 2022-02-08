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

# 