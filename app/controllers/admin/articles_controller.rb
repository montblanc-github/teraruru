class Admin::ArticlesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags_on(:tags)
    @comments = @article.comments
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @article.create_notification_hidden!
      flash[:notice] = "投稿の表示状態を変更しました。"
      redirect_to admin_article_path(@article.id)
    else
      flash[:notice] = "投稿の表示状態変更に失敗しました。"
      render :show
    end
  end

  def visible_update_all
    user = User.find(params[:format])
    user.articles.update_all(is_visible: true)
    flash[:notice] = "現在表示されているユーザの投稿をすべて表示状態に変更しました。"
    redirect_to admin_user_path(user.id)
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

  def destroy_all
    user = User.find(params[:format])
    user.articles.destroy_all
    flash[:notice] = "現在表示されているユーザの投稿をすべて削除しました。"
    redirect_to admin_user_path(user.id)
  end

  private

  def article_params
    params.require(:article).permit(:is_visible)
  end
end
