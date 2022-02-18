require 'rails_helper'

RSpec.describe 'Articleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { article.valid? }

    let(:user) { create(:user) }
    let!(:article) { build(:article, user_id: user.id) }

    context 'cultivar_nameカラム' do
      it '空欄でないこと' do
        article.cultivar_name = ''
        is_expected.to eq false
      end
      it '21文字以下であること: 21文字は〇' do
        article.cultivar_name = Faker::Lorem.characters(number: 21)
        is_expected.to eq true
      end
      it '21文字以下であること: 22文字は×' do
        article.cultivar_name = Faker::Lorem.characters(number: 22)
        is_expected.to eq false
      end

    end

    context 'levelカラム'do
      it '空欄でないこと' do
        article.level = ''
        is_expected.to eq false
      end
    end

    context 'categoryカラム'do
      it '空欄でないこと' do
        article.category = ''
        is_expected.to eq false
      end
    end

    context 'seasonカラム'do
      it '空欄でないこと' do
        article.season = ''
        is_expected.to eq false
      end
    end

    context 'fertilizer_existenceカラム'do
      it '空欄でないこと' do
        article.fertilizer_existence = ''
        is_expected.to eq false
      end
    end

    context 'fertilizer_infoカラム'do
      it 'fertilizer_existenceがtrueの時、空欄でないこと' do
        article.fertilizer_existence = 'true'
        article.fertilizer_info = ''
        is_expected.to eq false
      end
      it 'fertilizer_existenceがfalseの時、空欄でも〇' do
        article.fertilizer_existence = 'false'
        article.fertilizer_info = ''
        is_expected.to eq true
      end
      it '100文字以下であること: 100文字は〇' do
        article.fertilizer_existence = 'true'
        article.fertilizer_info = Faker::Lorem.characters(number: 100)
        is_expected.to eq true
      end
      it '100文字以下であること: 101文字は×' do
        article.fertilizer_existence = 'true'
        article.fertilizer_info = Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
    end

    context 'placeカラム'do
      it '空欄でないこと' do
        article.place = ''
        is_expected.to eq false
      end
    end

    context 'conditionカラム'do
      it '空欄でないこと' do
        article.condition = ''
        is_expected.to eq false
      end
    end

    context 'state_at_startカラム'do
      it '空欄でないこと' do
        article.state_at_start = ''
        is_expected.to eq false
      end
    end

    context 'messageカラム' do
      it '150文字以下であること: 150文字は〇' do
        article.message = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
      it '150文字以下であること: 151文字は×' do
        article.message = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
    end

    context 'tag_listカラム'do
      it '10個以下であること: 10個は〇' do
        article.tag_list = Faker::Lorem.words(number: 10)
        is_expected.to eq true
      end
      it '10個以下であること: 11個は×' do
        article.tag_list = Faker::Lorem.words(number: 11)
        is_expected.to eq false
      end
      it '10文字以下であること: 10文字は〇' do
        article.tag_list = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        article.tag_list = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Favoriteモデルとの関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Favoriteモデル(FavoriteUser)との関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:favorite_users).macro).to eq :has_many
      end
    end
    context 'Commentモデルとの関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:comments).macro).to eq :has_many
      end
    end
    context 'Notificationモデルとの関係' do
      it 'N:1となっている' do
        expect(Article.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
