require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:prefecture) { create(:prefecture) }
  let!(:municipality) { create(:municipality, prefecture_id: prefecture.id) }
  let!(:season) { create(:season) }
  let!(:article) { create(:article, user_id: user.id) }
  let!(:other_article) { create(:article, user_id: other_user.id) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済み。' do
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
      it 'マイページを押すと、マイページ画面に遷移する' do
        expect(page).to have_link 'マイページ', href: user_path(user.id)
        click_link 'マイページ', href: user_path(user.id)
        is_expected.to eq '/users/' + user.id
      end
      it 'ログアウトを押すと、トップ画面に遷移する' do
        expect(page).to have_link 'ログアウト', href: destroy_user_session_path
        click_link 'ログアウト', href: destroy_user_session_path
        is_expected.to eq '/'
      end
    end
  end

  describe '投稿一覧画面のテスト' do
    before do
      visit articles_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/articles'
      end
      it '自分の投稿と他人の投稿のリンク先がそれぞれ正しい' do
        expect(page).to have_link '', href: article_path(article.id)
        expect(page).to have_link '', href: article_path(other_article.id)
      end
    end
  end

  describe '自分の投稿詳細画面のテスト' do
    before do
      visit article_path(article.id)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/articles/' + article.id.to_s
      end
      it '名前のリンク先が正しい' do
        expect(page).to have_link article.user.account_name, href: user_path(article.user.id)
      end
      it 'フォローのリンク先が正しい' do
        expect(page).to have_link 'フォロー', href: user_followings_path(article.user.id)
      end
      it 'フォロワーのリンク先が正しい' do
        expect(page).to have_link 'フォロワー', href: user_followers_path(article.user.id)
      end
      it '投稿の編集リンクが表示される' do
        expect(page).to have_link '投稿内容を編集する', href: edit_article_path(article.id)
      end
      it '投稿の削除リンクが表示される' do
        expect(page).to have_link '投稿を削除する', href: article_path(article)
      end
    end

    context '編集リンクのテスト' do
      it '編集画面に遷移する' do
        click_link '投稿内容を編集する'
        expect(current_path).to eq '/articles/' + article.id.to_s + '/edit'
      end
    end

    context '削除リンクのテスト' do
      before do
        click_link '投稿を削除する'
      end

      it '正しく削除される' do
        expect(Article.where(id: article.id).count).to eq 0
      end
      it 'リダイレクト先が、トップ画面になっている' do
        expect(current_path).to eq '/'
      end
    end
  end

  describe '自分の投稿編集画面のテスト' do
    before do
      visit edit_article_path(article.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/articles/' + article.id.to_s + '/edit'
      end
      it '「投稿する」と表示される' do
        expect(page).to have_content '投稿する'
      end
      it '品種名入力フォームが表示される' do
        expect(page).to have_field 'article[cultivar_name]', with: article.cultivar_name
      end
      it '都道府県選択フォームが表示される' do
        expect(page).to have_select 'article[prefecture_id]', selected: Prefecture.find(article.prefecture_id).name
      end
      it '市区町村選択フォームが表示される' do
        expect(page).to have_select 'article[municipality_id]', selected: Municipality.find(article.municipality_id).municipality_name
      end
      it '難易度選択フォームが表示される' do
        expect(page).to have_select 'article[level]', selected: '普通'
      end
      it 'カテゴリラジオボタンが表示される' do
        expect(page).to have_checked_field('草木')
      end
      it '時期チェックボタンが表示される' do
        expect(page).to have_checked_field('1月')
      end
      it '肥料の有無ラジオボタンが表示される' do
        expect(page).to have_checked_field('あり')
      end
      it '肥料の詳細フォームが表示される' do
        expect(page).to have_field 'article[fertilizer_info]', with: article.fertilizer_info
      end
      it '場所ラジオボタンが表示される' do
        expect(page).to have_checked_field('屋内')
      end
      it '条件ラジオボタンが表示される' do
        expect(page).to have_checked_field('鉢')
      end
      it '開始時ラジオボタンが表示される' do
        expect(page).to have_checked_field('種から')
      end
      it 'メッセージフォームが表示される' do
        expect(page).to have_field 'article[message]', with: article.message
      end
    end

    context '編集成功のテスト' do
      before do
        @article_old_cultiver_name = article.cultivar_name
        fill_in 'article[cultivar_name]', with: Faker::Lorem.characters(number: 5)
        click_button '投稿する'
      end

      it 'cultivar_nameが正しく更新される' do
        expect(article.reload.cultivar_name).not_to eq @article_old_cultiver_name
      end
      it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
        expect(current_path).to eq '/articles/' + article.id.to_s
      end
    end
  end

  describe '自分のユーザ詳細画面のテスト' do
    before do
      visit user_path(user.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it '他人の投稿は表示されない' do
        expect(page).not_to have_link '', href: user_path(other_user.id)
        expect(page).not_to have_content other_article.cultivar_name
      end
    end
  end

  describe '自分のユーザ情報編集画面のテスト' do
    before do
      visit edit_user_path(user.id)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
      it 'アカウント名編集フォームに自分のアカウント名名が表示される' do
        expect(page).to have_field 'user[account_name]', with: user.account_name
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '自己紹介編集フォームに自分の自己紹介文が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '変更を保存するボタンが表示される' do
        expect(page).to have_button '変更を保存する'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_account_name = user.account_name
        @user_old_introduction = user.introduction
        fill_in 'user[account_name]', with: Faker::Lorem.characters(number: 9)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
        click_button '変更を保存する'
      end

      it 'account_nameが正しく更新される' do
        expect(user.reload.account_name).not_to eq @user_old_account_name
      end
      it 'introductionが正しく更新される' do
        expect(user.reload.introduction).not_to eq @user_old_intrpduction
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end
