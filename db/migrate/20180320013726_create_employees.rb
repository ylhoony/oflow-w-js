class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.integer :company_id
      t.integer :user_id
      t.string :job_title
      t.boolean :admin, default: false
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
