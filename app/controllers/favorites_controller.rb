class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(book: params[:book])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @book = Recipe.find(params[:book])
    @favorite = current_user.favorites.find_by(book: @book)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
