class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_not_article_user


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

  private

  def user_not_article_user
    article = Article.find(params[:article_id])
    if article.user == current_user
      flash[:notice] = "自分の投稿に「いいね」はできません。"
      redirect_to request.referer
    end
  end

end
