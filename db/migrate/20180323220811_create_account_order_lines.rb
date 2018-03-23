class CreateAccountOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :account_order_lines do |t|
      t.integer :account_order_id
      t.integer :product_id
      t.text :comment
      t.decimal :unit_price, default: 0, precision: 30, scale: 2
      t.decimal :quantity, default: 0, precision: 30, scale: 2

      t.timestamps null: false
    end
  end
end
