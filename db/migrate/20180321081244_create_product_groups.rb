class CreateProductGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :product_groups do |t|
      t.integer :company_id
      t.integer :product_category_id
      t.string :name
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
