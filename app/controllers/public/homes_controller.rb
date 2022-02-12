class Public::HomesController < ApplicationController
  def top
    @articles = Article.all
  end

  def about
  end
end
