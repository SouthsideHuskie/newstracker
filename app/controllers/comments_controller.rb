class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new

    @comment.content = params[:content]

    @comment.article_id = params[:article_id]

    @comment.user_id = params[:user_id]



    if @comment.save
      redirect_to "/articles/", :notice => "Comment created successfully."
    else
      render 'new'
    end

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])


    @comment.content = params[:content]

    @comment.article_id = params[:article_id]

    @comment.user_id = params[:user_id]



    if @comment.save
      redirect_to "/comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy


    redirect_to "/comments", :notice => "Comment deleted."

  end

def my_comments
  @comments = Comment.all
end
  def alltag
  @comments = Comment.all
  end

    def mytag
  @comments = Comment.all
  end
end
