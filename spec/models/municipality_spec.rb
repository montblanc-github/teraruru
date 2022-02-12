require 'rails_helper'

RSpec.describe 'Municipalityモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Prefectureモデルとの関係' do
      it 'N:1となっている' do
        expect(Municipality.reflect_on_association(:prefecture).macro).to eq :belongs_to
      end
    end
  end
end
