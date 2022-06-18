class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id ,:null => false
      t.string :ship_postal_code, :null =>false
      t.string :ship_address, :null => false
      t.string :ship_name, :null => false
      t.integer :status, :default => 1, :null => false
      t.integer :postage, :null => false
      t.integer :amount, :null => false
      t.integer :payment, :null => false
      t.integer :select_address
      t.integer :address_id
      t.timestamps

    end
  end
end
