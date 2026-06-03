class FavoritesController < ApplicationController
   before_action :require_authentication


  def index
    @favorite_books = Current.user.favorite_books
  end

  def create
    book = Book.find(params[:book_id])

    Current.user.favorites.create(book: book)

    redirect_to book, notice: "Added to favorites."
  end

  def destroy
    favorite = Current.user.favorites.find(params[:id])

    favorite.destroy

    redirect_to favorite.book,
                notice: "Removed from favorites."
  end
end
