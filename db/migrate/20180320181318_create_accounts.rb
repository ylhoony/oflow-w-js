class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :type
      t.integer :company_id
      t.string :name
      t.string :tax_id_number
      t.text :comment
      t.integer :payment_term_id
      t.integer :currency_id
      t.integer :warehouse_id
      t.boolean :active, dafault: false

      t.timestamps
    end
  end
end
