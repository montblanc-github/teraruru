class Public::UsersController < ApplicationController

  def show

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を変更しました。"
      redirect_to user_path
    else
      flash[:notice] = "ユーザ情報の変更に失敗しました。"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :address, :account_name, :profile_image, :introduction)
  end

end
