class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags_on(:tags)
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      article.create_notification_hidden!
      flash[:notice] = "投稿の表示状態を変更しました。"
      redirect_to admin_article_path(article.id)
    else
      flash[:notice] = "投稿の表示状態変更に失敗しました。"
      render :show
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      article.create_notification_delete!
      flash[:notice] = "投稿を削除しました。"
      redirect_to root_path
    else
      flash[:notice] = "投稿の削除に失敗しました。"
      redirect_to admin_article_path(article.id)
    end
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :artical_image_id, :cultivar_name, :prefecture_id, :municipality_id, :level, :category, :season, :fertilizer_existence, :fertilizer_info, :place, :condition, :state_at_start, :tag_list, :message, :is_delete)
  end
end
