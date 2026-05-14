class ChangeRatingToDecimalInReviews < ActiveRecord::Migration[8.1]
  def change
    change_column :reviews, :rating, :decimal, precision: 2, scale: 1
  end
end
