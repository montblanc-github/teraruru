require 'rails_helper'

RSpec.describe 'article_seasonsモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Seasonモデルとの関係' do
      it 'N:1となっている' do
        expect(ArticleSeason.reflect_on_association(:season).macro).to eq :belongs_to
      end
    end

    context 'Articleモデルとの関係' do
      it 'N:1となっている' do
        expect(ArticleSeason.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end
  end
end
