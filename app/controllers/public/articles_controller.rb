class Public::ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @article = Article.new
    @municipalities = Municipality.all
  end

  def create
    # @article = Article.new(article_params)
    # if @article.create
    #   flash[:notice] = "投稿を作成しました。"
    #   redirect_to article_path
    # else
    #   flash[:notice] = "投稿の作成に失敗しました。"
    #   render :new
    # end
  end

  def edit
  end

  def get_municipalities
    @municipalities = Municipality.where(prefecture_id: params[:prefecture_id])
  end

  private

  def article_params
    params.require(:article).permit(:artical_image_id, :cultivar_name, :prefecture, :municipality_name, :level, :season, :fertilizer_existence, :fertilizer_info, :place, :condition, :state_at_start, :message)
  end

end
