class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_2_code
      t.string :alpha_3_code
      t.string :numeric_code
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
