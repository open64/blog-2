class CommentsController < ApplicationController
  before_action :find_comment, only: [:edit, :destroy, :update]
  def new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], post_id: params[:post_id],
                           author_id: current_user[:id])
    @post = Post.find params[:post_id]
    respond_to do |format|
      if @comment.save
        render_show_comment(format)
      else
        format.html { render partial: 'posts/comment_error' }
      end
    end

  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to_post }
      format.json { head :no_content }
    end
  end

  def edit
    @post = Post.find params[:post_id]
    respond_to do |format|
      if @comment.author?(current_user)
        format.html { render partial: 'posts/comment_form' }
      else
        format.html { render text: 'You are not author of this post' }
      end
    end

  end

  def update
    @comment.update(params.require(:comment).permit(:content))
    @post = Post.find params[:post_id]
    respond_to do |format|
      render_show_comment format
    end
  end

  private
  def find_comment
    @comment ||= Comment.find params[:id]
  end

  def render_show_comment(format)
    format.html { render partial: 'posts/comment_show', object: @comment, as: 'comment' }
  end

  def redirect_to_post
    redirect_to post_path params[:post_id]
  end
end
