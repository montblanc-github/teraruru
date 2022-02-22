require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'last_nameカラム' do
      it '空欄でないこと' do
        user.last_name = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.last_name = 'てすとてすとてすとて'
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.last_name = 'てすとてすとてすとてす'
        is_expected.to eq false
      end
      it 'アルファベットでないこと' do
        user.first_name = 'test'
        is_expected.to eq false
      end
    end

    context 'first_nameカラム' do
      it '空欄でないこと' do
        user.first_name = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.first_name = 'てすとてすとてすとて'
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.first_name = 'てすとてすとてすとてす'
        is_expected.to eq false
      end
      it 'アルファベットでないこと' do
        user.first_name = 'test'
        is_expected.to eq false
      end
    end

    context 'last_name_kanaカラム' do
      it '空欄でないこと' do
        user.last_name_kana = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.last_name_kana = 'テストテストテストテ'
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.last_name_kana = 'テストテストテストテス'
        is_expected.to eq false
      end
      it 'カタカナであること' do
        user.last_name_kana = 'てすと'
        is_expected.to eq false
      end
    end

    context 'first_name_kanaカラム' do
      it '空欄でないこと' do
        user.first_name_kana = ''
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        user.first_name_kana = 'テストテストテストテ'
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.first_name_kana = 'テストテストテストテス'
        is_expected.to eq false
      end
      it 'カタカナであること' do
        user.first_name_kana = 'てすと'
        is_expected.to eq false
      end
    end

    context 'emailカラム' do
      it '空欄でないこと' do
        user.email = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        user.email = other_user.email
        is_expected.to eq false
      end
      it '254文字以下であること: 254文字は〇' do
        user.email = Faker::Lorem.characters(number: 200) + '@' + Faker::Lorem.characters(number: 50) + '.jp'
        is_expected.to eq true
      end
      it '254文字以下であること: 255文字は×' do
        user.email = Faker::Lorem.characters(number: 200) + '@' + Faker::Lorem.characters(number: 50) + '.com'
        is_expected.to eq false
      end
      it '~@~.comの形であること' do
        user.email = Faker::Lorem.characters(number: 10)
        is_expected.to eq false
      end
    end

    context 'post_codeカラム' do
      it '空欄でないこと' do
        user.post_code = ''
        is_expected.to eq false
      end
      it '7文字であること: 7文字は〇' do
        user.post_code = Faker::Number.number(digits: 7)
        is_expected.to eq true
      end
      it '7文字であること: 8文字は×' do
        user.post_code = Faker::Number.number(digits: 8)
        is_expected.to eq false
      end
      it '7文字であること: 6文字は×' do
        user.post_code = Faker::Number.number(digits: 6)
        is_expected.to eq false
      end
      it '数字であること' do
        user.post_code = Faker::Lorem.characters(number: 7)
        is_expected.to eq false
      end
    end

    context 'addressカラム' do
      it '空欄でないこと' do
        user.address = ''
        is_expected.to eq false
      end
      it '70文字以下であること: 70文字は〇' do
        user.address = Faker::Lorem.characters(number: 70)
        is_expected.to eq true
      end
      it '70文字以下であること: 71文字は×' do
        user.address = Faker::Lorem.characters(number: 71)
        is_expected.to eq false
      end
    end

    context 'account_nameカラム' do
      it '空欄でないこと' do
        user.account_name = ''
        is_expected.to eq false
      end
      it '15文字以下であること: 15文字は〇' do
        user.account_name = Faker::Lorem.characters(number: 15)
        is_expected.to eq true
      end
      it '15文字以下であること: 16文字は×' do
        user.account_name = Faker::Lorem.characters(number: 16)
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '150文字以下であること: 150文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
      it '150文字以下であること: 151文字は×' do
        user.introduction = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Articleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:articles).macro).to eq :has_many
      end
    end

    context 'Relationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end

    context 'Relationshipモデル(reverse_of_relationships)との関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:reverse_of_relationships).macro).to eq :has_many
      end
    end

    context 'Followingとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followings).macro).to eq :has_many
      end
    end

    context 'Followerとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followers).macro).to eq :has_many
      end
    end

    context 'UserRoomモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:user_rooms).macro).to eq :has_many
      end
    end

    context 'Chatモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:chats).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'FavoriteArticleとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorite_articles).macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'Notificationモデル(ActiveNotification)との関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
      end
    end

    context 'Notificationモデル(PassiveNotification)との関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:passive_notifications).macro).to eq :has_many
      end
    end
  end
end
