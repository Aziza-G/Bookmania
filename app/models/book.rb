class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :book_file
  has_one_attached :book_image

  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :page_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cost, presence: true
  validates :currency, presence: true
  validates :description, presence: true
  validates :notes, presence: true
  validates :language, presence: true
  validates :publication_date, presence: true

  validates :book_file, presence: true

  def average_rating
    reviews.average(:rating)&.round(1)
  end


  GENRES = [
  "Biography",
   "Children's",
   "Fantasy",
    "Fiction",
    "Historical Fiction",
    "Mystery",
    "Non-Fiction",
    "Poetry",
    "Romance",
    "Science Fiction",
    "Self-Help",
    "Thriller",
    "Young Adult"
].freeze
end
