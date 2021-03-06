class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!, except: [:followings, :followers]

  def create
    @user = User.find(params[:user_id])
    unless @user == current_user
      current_user.follow(@user.id)
    # 通知
      @user.create_notification_follow!(current_user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user.id)
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.page(params[:page]).per(6)
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(6)
  end
end
