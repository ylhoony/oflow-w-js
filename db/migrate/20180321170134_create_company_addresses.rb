class CreateCompanyAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :company_addresses do |t|
      t.string :name

      t.timestamps
    end
  end
end
