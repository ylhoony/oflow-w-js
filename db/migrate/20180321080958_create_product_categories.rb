class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.integer :company_id
      t.string :name
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
