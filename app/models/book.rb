class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :book_file

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
