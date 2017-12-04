class Addcategory_idToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :category_id, :int
  end
end
