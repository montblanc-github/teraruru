require 'rails_helper'

RSpec.describe 'Prefectureモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { prefecture.valid? }

    let(:prefecture) { build(:prefecture) }

    context 'nameカラム' do
      it '空欄でないこと' do
        prefecture.name = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Municipalityモデルとの関係' do
      it '1:Nとなっている' do
        expect(Prefecture.reflect_on_association(:municipalities).macro).to eq :has_many
      end
    end
  end
end
