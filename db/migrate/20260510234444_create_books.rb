class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
