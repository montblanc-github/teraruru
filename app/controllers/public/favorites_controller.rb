class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    current_user.favorite(@article)
    # 通知
    @article.create_notification_by(current_user)
  end

  def destroy
    @article = Article.find(params[:article_id])
    current_user.unfavorite(@article)
  end
end
