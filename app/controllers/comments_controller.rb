class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], post_id: params[:id],
                           author_id: Post.find(params[:id])[:author_id])
    @comment.save

    redirect_to post_path(params[:id])
  end

  def destroy
    comment = Comment.find params[:format]
    comment.destroy
    redirect_to post_path(params[:id])
  end

  def edit
    @post = Post.find params[:id]
    @comment = Comment.find params[:format]
    #@comment = Comment.new(post: @post)
  end

  def update
    @comment = Comment.find(params[:format])
    @comment.update(content: params[:comment][:content])
    redirect_to post_path params[:id]
  end

  private
  def current_user_id
    current_user[:id]
  end
end
