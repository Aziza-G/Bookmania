class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authorize_book_owner, only: %i[ edit update destroy ]

  # GET /books or /books.json
  def index
    @books = Book.order(created_at: :desc)


    if params[:genre].present?
      @books = @books.where("LOWER(genre = ?)",
      params[:genre])
    end
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    Rails.logger.debug params.inspect if Rails.env.development?
    @book = Book.new(book_params)
    @book.user = Current.user

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, notice: "Book was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end


  private
  def authorize_book_owner
    return if @book.user.present? && @book.user == Current.user

    unless @book.user == Current.user
      redirect_to books_path, alert: "You are not authorized to do that." and return
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect[:id])
    end

    # Only allow a list of trusted parameters through. note: expect was changed to require
    def book_params
      params.require(:book).permit ([ :name,
        :author,
        :cost,
        :currency,
        :genre,
        :page_count,
        :language,
        :publication_date,
        :description,
        :notes,
        :book_file,
       :book_image
    ])
    end
end
