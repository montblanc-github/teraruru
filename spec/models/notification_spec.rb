require 'rails_helper'

RSpec.describe 'Notificationモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { notification.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { create(:user) }
    let!(:season) { create(:season) }
    let(:article) { create(:article, user_id: user.id) }
    let(:favorite) { create(:favorite) }
    let!(:notification) { build(:notification, article_id: article.id, visiter_id: other_user.id, visited_id: user.id) }

    context 'visited_idカラム' do
      it '空欄でないこと' do
        notification.visited_id = ''
        is_expected.to eq false
      end
    end

    context 'actionカラム' do
      it '空欄でないこと' do
        notification.action = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Articleモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:article).macro).to eq :belongs_to
      end
    end
    context 'Commentモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:comment).macro).to eq :belongs_to
      end
    end
    context 'Userモデル(Visiter)との関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visiter).macro).to eq :belongs_to
      end
    end
    context 'Userモデル(Visited)との関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
      end
    end
  end
end
