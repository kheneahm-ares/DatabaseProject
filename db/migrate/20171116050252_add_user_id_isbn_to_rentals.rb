class AddUserIdIsbnToRentals < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :userId, :bigint
    add_column :rentals, :isbn, :bigint
  end
end
