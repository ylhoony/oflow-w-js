class CreateAccountAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :account_addresses do |t|
      t.integer :account_id
      t.string :company_name
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
      t.text :comment
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
