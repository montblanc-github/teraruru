class Public::HomesController < ApplicationController
  def top
    article_array = Article.extract_favorite_ranking_articles
    @favorite_articles = Kaminari.paginate_array(article_array).page(params[:page]).per(6)
    most_tags_articles = Article.public_recent
    @tags = most_tags_articles.tag_counts_on(:tags).order('tags_count desc').limit(10)
    if user_signed_in?
      following_users = User.find(current_user.id).followings
      @following_articles = Article.where(user_id: following_users, is_visible: true).order(updated_at: :desc).page(params[:top_article_page]).per(6)
    end
  end

  def about
  end
end
