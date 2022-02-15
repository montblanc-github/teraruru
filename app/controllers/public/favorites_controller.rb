class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    current_user.favorite(@article)
    # 通知
    @aticle.create_notification_by(current_user)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    current_user.unfavorite(@article)
  end
end
