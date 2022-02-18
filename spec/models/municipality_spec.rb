require 'rails_helper'

RSpec.describe 'Municipalityモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { municipality.valid? }

    let(:prefecture) { create(:prefecture) }
    let!(:municipality) { build(:municipality, prefecture_id: prefecture.id) }

    context 'municipality_nameカラム' do
      it '空欄でないこと' do
        municipality.municipality_name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Prefectureモデルとの関係' do
      it 'N:1となっている' do
        expect(Municipality.reflect_on_association(:prefecture).macro).to eq :belongs_to
      end
    end
  end
end
