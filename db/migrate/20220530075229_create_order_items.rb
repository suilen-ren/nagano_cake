class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id, :null => false
      t.integer :order_id, :null => false
      t.integer :price_then,:null => false
      t.integer :quantity, :null => false
      t.integer :making_status, :null => false, :default => 1

      t.timestamps
    end
  end
end
