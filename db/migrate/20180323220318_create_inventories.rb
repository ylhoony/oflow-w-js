class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :company_id
      t.integer :warehouse_id
      t.integer :product_id
      t.decimal :quantity
      t.decimal :total_value

      t.timestamps null: false
    end
  end
end
