class CreateCompanyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :company_contacts do |t|
      t.integer :company_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :email
      t.string :phone
      t.text :comment
      t.boolean :active, default: false

      t.timestamps null: false
    end
  end
end
