class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
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
      redirect_to "/articles", :notice => "Article created successfully."
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
      redirect_to "/articles", :notice => "Article updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy


    redirect_to "/articles", :notice => "Article deleted."

  end

  def my_articles
   @articles = Article.all
 end
end
