class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new

    @favorite.user_id = params[:user_id]

    @favorite.article_id = params[:article_id]



    if @favorite.save
      redirect_to "/articles/#{@favorite.article_id}", :notice => "Favorite created successfully."
    else
      render 'new'
    end

  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])


    @favorite.user_id = params[:user_id]

    @favorite.article_id = params[:article_id]



    if @favorite.save
      redirect_to "/favorites", :notice => "Favorite updated successfully."
    else
      render 'edit'
    end

  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy


    redirect_to "/favorites", :notice => "Favorite deleted."

  end

def my_favorites
  @favorites = Favorite.all
end

  def alltag
    @articles = Article.where({ :tag => params[:tag]})
    @favorites = Favorite.where({:article_id => @articles})
  end

    def mytag
    @articles = Article.where({ :tag => params[:tag]})
    @favorites = Favorite.where({:article_id => @articles}).where({:user_id => current_user.id})
  end
end
