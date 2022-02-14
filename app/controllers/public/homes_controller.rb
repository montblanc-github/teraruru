class Public::HomesController < ApplicationController
  def top
    @articles = Article.page(params[:page]).per(6)
    user = User.find(current_user.id)
    following_users = user.followings
    @following_articles = Article.where(user_id: following_users).order(created_at: :desc).page(params[:top_article_page]).per(6)
  end

  def about
  end
end
