require 'rails_helper'

RSpec.describe 'Commentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { comment.valid? }

    let(:user) { create(:user) }
    let!(:season) { create(:season) }
    let(:article) { create(:article, user_id: user.id) }
    let!(:comment) { build(:comment, user_id: user.id, article_id: article.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        comment.content = ''
        is_expected.to eq false
      end
      it '150文字以下であること: 150文字は〇' do
        comment.content = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
      it '150文字以下であること: 151文字は×' do
        comment.content = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Articleモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end
  end
end
