class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :book_id
      t.integer :order_id
      t.integer :quantity
      t.integer :total_books

      t.timestamps
    end
  end
end
