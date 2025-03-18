class CommentsController < ApplicationController
  before_action :require_login

  def create
    @favorite = Favorite.find_by(id: params[:favorite_id])

    if @favorite.nil?
      redirect_to favorites_path, alert: "Favorite not found!" and return
    end

    @comment = @favorite.comments.build(comment_params)
    @comment.user = current_user  

    if @comment.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to favorites_path, notice: "Comment added successfully!" }
      end
    else
      redirect_to favorites_path, alert: "Error: #{@comment.errors.full_messages.join(", ")}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(favorite_id: params[:favorite_id])
  end
end
