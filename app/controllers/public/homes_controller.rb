class Public::HomesController < ApplicationController

  def top
    articles_array = Article.includes(:favorite_users).sort{|a,b| b.favorite_users.size <=> a.favorite_users.size}
    @favorite_articles = Kaminari.paginate_array(articles_array).page(params[:page]).per(6)
    if user_signed_in?
      user = User.find(current_user.id)
      following_users = user.followings
      @following_articles = Article.where(user_id: following_users).order(created_at: :desc).page(params[:top_article_page]).per(6)
    end
  end

  def about
  end
end
