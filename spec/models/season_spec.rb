require 'rails_helper'

RSpec.describe 'seasonモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { season.valid? }

    let(:season) { create(:season) }

    context 'monthカラム' do
      it '空欄でないこと' do
        season.month = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'ArticleSeasonモデルとの関係' do
      it '1:Nとなっている' do
        expect(Season.reflect_on_association(:article_seasons).macro).to eq :has_many
      end
    end
    context 'Articleモデルとの関係' do
      it 'N:Nとなっている' do
        expect(Season.reflect_on_association(:articles).macro).to eq :has_many
      end
    end
  end
end