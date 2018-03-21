class CreateUnitOfMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :unit_of_measures do |t|
      t.string :name
      t.integer :company_id
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
