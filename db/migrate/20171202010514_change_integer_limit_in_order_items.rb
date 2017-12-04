class ChangeIntegerLimitInOrderItems < ActiveRecord::Migration[5.1]
  def change
    change_column :order_items, :order_id, :integer, limit: 8
  end
end
