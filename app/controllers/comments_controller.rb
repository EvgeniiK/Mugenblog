class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_article
  load_and_authorize_resource

  def edit
    render partial: 'comments/form'
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      render partial: 'comments/comment'
    else
      render partial: 'comments/form'
    end
  end

  def update
    if @comment.update(comment_params)
      render partial: 'comments/comment'
    else
      render partial: 'comments/form'
    end
  end

  def destroy
    @comment.destroy
    render json: 'status:deleted'.to_json
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
