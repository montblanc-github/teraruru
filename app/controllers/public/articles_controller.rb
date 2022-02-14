class Public::ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :get_municipalities, :get_municipalities_search]
  impressionist :actions => [:show]

  def index
    @articles = Article.search(params[:keyword]).page(params[:page]).per(9)
    @q = Article.ransack(params[:q])
    @prefectures = Prefecture.all
    @municipalities = Municipality.all
    if @tag = params[:tag]
      @articles = Article.tagged_with(params[:tag]).page(params[:page]).per(9)
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = @article.user
    @tags = @article.tags_on(:tags)
    @comment = Comment.new
    @comments = @article.comments
    # can't cast Rack::Session::SessionIdエラーを解消するため、to_sを記載。
    impressionist(@article, nil, unique: [:session_hash.to_s])
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
    @prefectures = Prefecture.all
    @municipalities = Municipality.all
    @prefecture_id = @article.prefecture_id
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

  def search
    @q = Article.ransack(params[:q])
    @articles = @q.result.page(params[:page]).per(9)
    @prefectures = Prefecture.all
    @municipalities = Municipality.all
    @prefecture_id = params[:q][:prefecture_id_eq]
  end

  def get_municipalities
    @municipalities = Municipality.where(prefecture_id: params[:prefecture_id])
  end

  def get_municipalities_search
    @municipalities = Municipality.where(prefecture_id: params[:prefecture_id])
  end

  private

  def article_params
    params.require(:article).permit(:user_id, :artical_image_id, :cultivar_name, :prefecture_id, :municipality_id, :level, :category, :season, :fertilizer_existence, :fertilizer_info, :place, :condition, :state_at_start, :tag_list, :message)
  end
end
