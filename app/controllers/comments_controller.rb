class CommentsController < ApplicationController
  def new
    #@comment = Comment.new(:post => @post)
    #@post = Post.find (6)
  end

  def create
    @comment = Comment.new(content: params[:comment][:content], post_id: params[:post_id])
    @comment.save
  end

  def delete
  end

  def edit
  end
end
