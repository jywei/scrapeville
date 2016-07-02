class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  load_and_authorize_resource param_method: :my_sanitizer
  load_and_authorize_resource through: :current_user
  before_action :authenticate_user!

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @newsville = Newsville.find(params[:newsville_id])
    @comment = @newsville.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @newsville, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.newsville, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:newsville_id, :body, :user_id)
    end

    def my_sanitizer
      params.require(:comment).permit(:body)
    end
end
