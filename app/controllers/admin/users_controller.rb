class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(6)
  end

  def show
  end

  def edit
  end
end
