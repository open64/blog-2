class CommentsController < ApplicationController
  before_filter :find_comment, only: [:edit, :destroy, :update]
  def new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], post_id: params[:id],
                           author_id: current_user[:id])
    @comment.save
    redirect_to_post
  end

  def destroy
    @comment.destroy
    redirect_to_post
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @comment.update(content: params[:comment][:content])
    redirect_to_post
  end

  private
  def find_comment
    @comment ||= Comment.find params[:format]
  end

  def redirect_to_post
    redirect_to post_path params[:id]
  end
end
