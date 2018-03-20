class CreatePaymentTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_terms do |t|
      t.string :name
      t.integer :company_id
      t.decimal :trade_credit_percent, default: 0, precision: 30, scale: 2
      t.integer :trade_credit_days, default: 0
      t.integer :date_days, default: 0
      t.integer :payment_option_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
