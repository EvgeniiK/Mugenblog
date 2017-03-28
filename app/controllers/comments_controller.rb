class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
  end

  def new
  end

  # GET /comments/1/edit
  def edit
    render partial: 'comments/form'
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.article_id = params[:article_id]
    render :nothing
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { render @comment }
      else
        format.html { render :edit }
      end
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
