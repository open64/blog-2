class CommentsController < ApplicationController
  before_filter :find_comment, only: [:edit, :destroy, :update]
  def new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], post_id: params[:post_id],
                           author_id: current_user[:id])
    @post = Post.find params[:post_id]
    respond_to do |format|
      if @comment.save
        format.html { render partial: 'posts/comment_show', object: @comment, as: 'comment' }
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
  end

  def update
    @comment.update(content: params[:comment][:content])
    redirect_to_post
  end

  private
  def find_comment
    @comment ||= Comment.find params[:id]
  end

  def redirect_to_post
    redirect_to post_path params[:id]
  end
end
