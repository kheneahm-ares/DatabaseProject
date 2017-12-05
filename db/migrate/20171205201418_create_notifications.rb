class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :message
      t.integer :rentalId
      t.integer :userId

      t.timestamps
    end
  end
end
