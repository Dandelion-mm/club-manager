class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    comment.update(username: current_user.username)
    comment.update(user_id: current_user.id)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end