class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books, id: false do |t|
      t.primary_key :isbn
      t.string :title
      t.integer :pages
      t.string :publisher
      t.integer :copiesLeft

      t.timestamps
    end
  end
end
