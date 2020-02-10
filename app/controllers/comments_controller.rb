class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @article_id = comment_params["article_id"]
      redirect_to article_path(@article_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      @article_id = comment_params["article_id"]
      redirect_to article_path(@article_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.permit(:message,:article_id).merge(user_id: current_user.id)
  end
end
