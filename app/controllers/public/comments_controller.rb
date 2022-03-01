class Public::CommentsController < ApplicationController
  before_action :login_check
  before_action :comment_user_authority, only: [:destroy]

  def create
    article = Article.find(params[:article_id])
    @comments = article.comments
    comment = current_user.comments.new(comment_params)
    comment.article_id = article.id
    if comment.save
      if article.user != current_user
        article.create_notification_comment!(current_user, comment.id, article.user_id)
      end
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

  def login_check
    if !(user_signed_in? || admin_signed_in?)
      redirect_to new_user_session_path
    end
  end

  def comment_user_authority
    if Comment.find_by(id: params[:id], article_id: params[:article_id]).user_id != current_user.id
      redirect_to root_path
    end
  end
end
