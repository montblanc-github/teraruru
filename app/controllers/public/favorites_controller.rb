class Public::FavoritesController < ApplicationController
  before_action :authenticata_user!

  def create
    @article = Article.find(params[:id])
    current_user.favorite(@article)
  end

  def destroy
    @article = Favorite.find(params[:id]).article
    current_user.unlike(@article)
  end

end
