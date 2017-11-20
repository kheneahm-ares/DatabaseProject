class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.date :dateRented
      t.date :dateDue
      t.integer :daysLeft
      t.boolean :isRenewed
      t.boolean :isReturned
      t.date :dateReturned
      t.float :fee

      t.timestamps
    end
  end
end
