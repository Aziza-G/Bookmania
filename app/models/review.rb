class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, presence: true
  validates :content, presence: true
  validates :user_id, uniqueness: { scope: :book_id }
end
