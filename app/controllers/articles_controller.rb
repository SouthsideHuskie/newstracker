class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new

    @article.title = params[:title]

    @article.article_url = params[:article_url]

    @article.tag = params[:tag]

    @article.user_id = params[:user_id]

    @article.description = params[:description]



    if @article.save
      redirect_to "/my_articles", :notice => "Article created successfully."
    else
      render 'new'
    end

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])


    @article.title = params[:title]

    @article.article_url = params[:article_url]

    @article.tag = params[:tag]

    @article.user_id = params[:user_id]

    @article.description = params[:description]



    if @article.save
      redirect_to "/my_articles", :notice => "Article updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])
    @article.comments.destroy_all
    @article.favorites.destroy_all
    @article.destroy



    redirect_to "/my_articles", :notice => "Article deleted."

  end

  def my_articles
   @articles = Article.all

  end

  def alltag
    @articles = Article.where({ :tag => params[:tag]})
  end

    def mytag
    @articles = Article.where({ :tag => params[:tag]}).where({:user_id => current_user.id})
  end
end
