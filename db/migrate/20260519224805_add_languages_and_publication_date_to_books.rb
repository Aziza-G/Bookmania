class AddLanguagesAndPublicationDateToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :language, :string
    add_column :books, :publication_date, :date
  end
end
