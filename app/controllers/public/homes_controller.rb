class Public::HomesController < ApplicationController
  def top
    @articles = Article.all
  end
end
