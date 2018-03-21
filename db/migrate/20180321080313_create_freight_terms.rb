class CreateFreightTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :freight_terms do |t|
      t.string :name
      t.integer :company_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
