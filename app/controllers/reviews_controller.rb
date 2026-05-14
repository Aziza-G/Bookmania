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

  def edit
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])

    if @review.update(review_params)
      redirect_to @book, notice: "Review updated sucessfully."
    else
      render :edit,
      status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = @book.reviews.find(params[:id])
    @review.destroy

    redirect_to @book, notice: "Review deleted successfully."
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
