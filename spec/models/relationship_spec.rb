require 'rails_helper'

RSpec.describe 'Relationshipモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { relationship.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { create(:user) }
    let!(:relationship) { build(:relationship, follower_id: user.id, followed_id: other_user.id) }

    context 'follower_idカラム' do
      it '空欄でないこと' do
        relationship.follower_id = ''
        is_expected.to eq false
      end
    end
    context 'followed_idカラム' do
      it '空欄でないこと' do
        relationship.followed_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデル(Follower)との関係' do
      it 'N:1となっている' do
        expect(Relationship.reflect_on_association(:follower).macro).to eq :belongs_to
      end
    end
    context 'Userモデル(Followed)との関係' do
      it 'N:1となっている' do
        expect(Relationship.reflect_on_association(:followed).macro).to eq :belongs_to
      end
    end
  end
end
