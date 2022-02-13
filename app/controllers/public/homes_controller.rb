class Public::HomesController < ApplicationController
  def top
    @articles = Article.page(params[:page]).per(6)
  end

  def about
  end
end
