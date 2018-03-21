class CreateCompanyContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :company_contacts do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
