class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    article = Article.find(params[:article_id])
    @comments = article.comments
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    if comment.save
        comment.article.create_notification_comment!(current_user, comment.id)
        render :show
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    @comments = article.comments
    comment = Comment.find_by(id: params[:id], article_id: params[:article_id])
    comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
