class FavoritesController < ApplicationController
  before_action :require_login

  def index
    @favorites = current_user.favorites.includes(:comments)
  end
  

  
  def create
    @favorite = current_user.favorites.find_or_initialize_by(article_url: params[:article_url])

    if @favorite.persisted?
      redirect_to articles_path, alert: "You have already saved this article!"
    elsif @favorite.update(favorite_params)
      
      redirect_to articles_path, notice: "Article saved successfully!"
    else
      redirect_to articles_path, alert: "Error: #{@favorite.errors.full_messages.join(", ")}"
    end
  end  

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])

    if @favorite
      @favorite.destroy
      redirect_to favorites_path, notice: "Article removed successfully!"
    else
      redirect_to favorites_path, alert: "Error: Article not found or already deleted!"
    end
  end

  private

  def favorite_params
    params.permit(:article_title, :article_url, :article_source, :article_category)
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must be logged in to save articles!"
    end
  end
end
