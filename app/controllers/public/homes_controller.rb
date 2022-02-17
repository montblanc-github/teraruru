class Public::HomesController < ApplicationController
  def top
    article_array = Article.extract_favorite_ranking_articles
    @favorite_articles = Kaminari.paginate_array(article_array).page(params[:page]).per(3)
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    if user_signed_in?
      following_users = User.find(current_user.id).followings
      @following_articles = Article.where(user_id: following_users, is_visible: true).order(created_at: :desc).page(params[:top_article_page]).per(6)
    end
  end

  def about
  end
end
