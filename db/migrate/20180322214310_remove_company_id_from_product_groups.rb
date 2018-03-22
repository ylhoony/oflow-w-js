class RemoveCompanyIdFromProductGroups < ActiveRecord::Migration[5.1]
  def change
    remove_column :product_groups, :company_id, :integer
  end
end
