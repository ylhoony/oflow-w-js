class AddCompanyIdToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :company_id, :integer
  end
end
