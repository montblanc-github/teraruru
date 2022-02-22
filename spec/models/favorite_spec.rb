require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { favorite.valid? }

    let(:user) { create(:user) }
    let!(:season) { create(:season) }
    let(:article) { create(:article, user_id: user.id) }
    let!(:favorite) { build(:favorite, user_id: user.id, article_id: article.id) }

    context 'user_idカラム' do
      it '空欄でないこと' do
        favorite.user_id = ''
        is_expected.to eq false
      end
    end

    context 'article_idカラム' do
      it '空欄でないこと' do
        favorite.article_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Articleモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end
  end
end
