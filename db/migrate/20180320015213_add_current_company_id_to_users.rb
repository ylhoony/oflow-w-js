class AddCurrentCompanyIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_company_id, :integer
  end
end
