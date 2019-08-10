class AddRentalCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :rental_count, :int
  end
end
