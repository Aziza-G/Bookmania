class AddCurrencyToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :currency, :string
  end
end
