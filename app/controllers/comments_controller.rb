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
      redirect_to "/articles/#{@comment.article_id}", :notice => "Comment created successfully."
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
      redirect_to "/my_comments", :notice => "Comment updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy


    redirect_to "/my_comments", :notice => "Comment deleted."

  end

def my_comments
  @comments = Comment.all
end
  def alltag
    @articles = Article.where({ :tag => params[:tag]})
    @comments = Comment.where({:article_id => @articles})
  end

    def mytag
    @articles = Article.where({ :tag => params[:tag]})
    @comments = Comment.where({:article_id => @articles}).where({:user_id => current_user.id})
  end
end
