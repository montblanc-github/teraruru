require 'rails_helper'

describe '[STEP1] ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match('About')
      end
      it '投稿一覧リンクが表示される: 左上から3番目のリンクが「投稿一覧」である' do
        articles_link = find_all('a')[2].native.inner_text
        expect(articles_link).to match('投稿一覧')
      end
      it '新規登録リンクが表示される: 左上から4番目のリンクが「新規登録」である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match('新規登録')
      end
      it 'ログインリンクが表示される: 左上から5番目のリンクが「ログイン」である' do
        sign_in_link = find_all('a')[4].native.inner_text
        expect(sign_in_link).to match('ログイン')
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'ロゴを押すと、トップ画面に遷移する' do
        expect(page).to have_link nil, href: root_path
        click_link nil, href: root_path
        is_expected.to eq '/'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        expect(page).to have_link 'About', href: about_path
        click_link 'About', href: about_path
        is_expected.to eq '/about'
      end
      it '投稿一覧を押すと、投稿一覧画面に遷移する' do
        expect(page).to have_link '投稿一覧', href: articles_path
        click_link '投稿一覧', href: articles_path
        is_expected.to eq '/articles'
      end
      it '新規登録を押すと、新規登録画面に遷移する' do
        expect(page).to have_link '新規登録', href: new_user_registration_path
        click_link '新規登録', href: new_user_registration_path
        is_expected.to eq '/users/sign_up'
      end
      it 'ログインを押すと、ログイン画面に遷移する' do
        expect(page).to have_link 'ログイン', href: new_user_session_path
        click_link 'ログイン', href: new_user_session_path
        is_expected.to eq '/users/sign_in'
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it 'last_nameフォームが表示される' do
        expect(page).to have_field 'user[last_name]'
      end
      it 'first_nameフォームが表示される' do
        expect(page).to have_field 'user[first_name]'
      end
      it 'last_name_kanaフォームが表示される' do
        expect(page).to have_field 'user[last_name_kana]'
      end
      it 'first_name_kanaフォームが表示される' do
        expect(page).to have_field 'user[first_name_kana]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'post_codeフォームが表示される' do
        expect(page).to have_field 'user[post_code]'
      end
      it 'addressフォームが表示される' do
        expect(page).to have_field 'user[address]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it 'account_nameフォームが表示される' do
        expect(page).to have_field 'user[account_name]'
      end
      it 'profile_imageフォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it 'introductionフォームが表示される' do
        expect(page).to have_field 'user[introduction]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do
      before do
        test_user = Gimei.name
        fill_in 'user[last_name]', with: test_user.last.kanji
        fill_in 'user[first_name]', with: test_user.first.kanji
        fill_in 'user[last_name_kana]', with: test_user.last.katakana
        fill_in 'user[first_name_kana]', with: test_user.first.katakana
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[post_code]', with: Faker::Number.number(digits: 7)
        fill_in 'user[address]', with: Faker::Address.full_address
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        fill_in 'user[account_name]', with: Faker::Lorem.characters(number: 5)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 20)
      end

      it '正しく新規登録される' do
        expect{ click_button '新規登録' }.to change { User.count }.by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button '新規登録'
        expect(current_path).to eq '/users/' + User.last.id
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
        expect(current_path).to eq '/'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'Aboutリンクが表示される: 左上から2番目のリンクが「About」である' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match('About')
      end
      it '投稿一覧リンクが表示される: 左上から3番目のリンクが「投稿一覧」である' do
        articles_link = find_all('a')[2].native.inner_text
        expect(articles_link).to match('投稿一覧')
      end
      it '投稿するリンクが表示される: 左上から4番目のリンクが「投稿する」である' do
        sign_up_link = find_all('a')[3].native.inner_text
        expect(sign_up_link).to match('投稿する')
      end
      it 'マイページリンクが表示される: 左上から5番目のリンクが「マイページ」である' do
        sign_in_link = find_all('a')[4].native.inner_text
        expect(sign_in_link).to match('マイページ')
      end
      it 'ログアウトリンクが表示される: 左上から6番目のリンクが「ログアウト」である' do
        logout_link = find_all('a')[5].native.inner_text
        expect(logout_link).to match('ログアウト')
      end
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(page).to have_link 'ログアウト', href: destroy_user_session_path
      click_link 'ログアウト', href: destroy_user_session_path
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/about'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/'
      end
    end
  end
end
