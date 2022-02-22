require 'rails_helper'

RSpec.describe 'Chatモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { chat.valid? }

    let(:room) { create(:room) }
    let(:user) { create(:user) }
    let!(:chat) { build(:chat, room_id: room.id, user_id: user.id) }

    context 'contentカラム' do
      it '空欄でないこと' do
        chat.content = ''
        is_expected.to eq false
      end
      it '150文字以下であること: 150文字は〇' do
        chat.content = Faker::Lorem.characters(number: 150)
        is_expected.to eq true
      end
      it '150文字以下であること: 151文字は×' do
        chat.content = Faker::Lorem.characters(number: 151)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Chat.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
  end
end
