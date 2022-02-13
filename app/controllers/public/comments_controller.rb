class Public::CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        article = Article.find(params[:id])
        comment = current_user.comments.new(comment_param)
        comment.article_id = article.id
        comment.save
        redirect_to article_path(article)
    end
    
    def destroy
        comment = Comment.find_by(id: params[:id], article_id: params[:article_id]).destroy
        redirect_to article_path(params[:article_id])
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
