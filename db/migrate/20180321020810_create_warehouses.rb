class CreateWarehouses < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses do |t|
      t.integer :company_id
      t.string :name
      t.string :attention
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.integer :country_id
      t.string :postal_code
      t.string :email
      t.string :phone
      t.string :fax
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
