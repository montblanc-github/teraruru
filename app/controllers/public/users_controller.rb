class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :ensure_guest_user, only: [:edit, :update]
  before_action :user_profile_autority, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.public_fixed_recent.page(params[:page]).per(15)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "ユーザを削除しました。"
      redirect_to root_path
    else
      flash[:notice] = "ユーザの削除に失敗しました。"
      render :unsubscribe
    end
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :account_name, :profile_image, :introduction)
  end

  # ゲストログイン機能では、編集できないようにする。
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.account_name == "guestuser"
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def user_profile_autority
    if User.find(params[:id]) != current_user
      redirect_to root_path
    end
  end
end
