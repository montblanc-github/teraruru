require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Articleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:articles).macro).to eq :has_many
      end
    end
  end
end
