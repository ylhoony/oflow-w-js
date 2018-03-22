class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :company_id
      t.integer :product_group_id
      t.string :sku
      t.string :name
      t.integer :price
      t.integer :unit_of_measure_id

      t.timestamps null: false
    end
  end
end
