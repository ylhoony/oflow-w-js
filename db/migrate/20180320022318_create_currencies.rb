class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :code_alpha
      t.string :code_numeric
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
