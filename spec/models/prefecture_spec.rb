require 'rails_helper'

RSpec.describe 'Prefectureモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Municipalityモデルとの関係' do
      it '1:Nとなっている' do
        expect(Prefecture.reflect_on_association(:municipalities).macro).to eq :has_many
      end
    end
  end
end