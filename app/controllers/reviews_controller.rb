class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)

    if @review.save
      redirect_to @book, notice: "Review added!"
    else
      redirect_to @book, alert: "Failed to add review."
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
