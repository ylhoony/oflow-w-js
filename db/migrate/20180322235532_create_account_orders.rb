class CreateAccountOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :account_orders do |t|
      t.integer :company_address_id
      t.integer :warehouse_id
      t.integer :account_id
      t.integer :account_address_id
      t.string :type
      t.string :reference
      t.text :comment
      t.integer :order_status_id

      t.timestamps null: false
    end
  end
end
