class Public::ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags_on(:tags)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    article.user_id = current_user.id
    if article.save
      flash[:notice] = "投稿を作成しました。"
      redirect_to article_path(article.id)
    else
      flash[:notice] = "投稿の作成に失敗しました。"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.update(article_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to article_path(article.id)
    else
      flash[:notice] = "投稿の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to root_path
    else
      flash[:notice] = "投稿の削除に失敗しました。"
      redirect_to article_path(article.id)
    end
  end

  def get_municipalities
    @municipalities = Municipality.where(prefecture_id: params[:prefecture_id])
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :artical_image_id, :cultivar_name, :prefecture_id, :municipality_id, :level, :category, :season, :fertilizer_existence, :fertilizer_info, :place, :condition, :state_at_start, :tag_list, :message)
  end

end
