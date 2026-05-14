class AddCostToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :cost, :decimal, precision: 8, scale: 2
  end
end
