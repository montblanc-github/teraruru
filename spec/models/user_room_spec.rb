require 'rails_helper'

RSpec.describe 'UserRoomモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user_room.valid? }

    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let!(:user_room) { build(:user_room, room_id: room.id, user_id: user.id) }

    context 'room_idカラム' do
      it '空欄でないこと' do
        user_room.room_id = ''
        is_expected.to eq false
      end
    end

    context 'user_idカラム' do
      it '空欄でないこと' do
        user_room.user_id = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(UserRoom.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(UserRoom.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end
