class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_article
  before_action :set_comments, only: [:update, :create]
  load_and_authorize_resource

  # GET /comments/1/edit
  def edit
    render partial: 'comments/form'
  end

  # POST /comments
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = @article.id
    if @comment.save
      render partial: 'comments/comment'
    else
      render partial: 'comments/form'
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render partial: 'comments/comment'
    else
      render partial: 'comments/form'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    render json: 'status:deleted'.to_json
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_comments
    #@comments = @article.comments.order(created_at: :desc).page(params[:page]).per(10)
    @comments = Comment.where(article: @article).order(created_at: :desc)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
