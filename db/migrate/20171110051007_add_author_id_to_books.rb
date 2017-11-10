class AddAuthorIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :authorId, :integer
  end
end
