class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).per(6)
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "会員情報を変更しました。"
      redirect_to admin_user_path
    else
      flash[:notice] = "会員情報の変更に失敗しました。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :account_name, :profile_image, :introduction, :is_active)
  end
end
