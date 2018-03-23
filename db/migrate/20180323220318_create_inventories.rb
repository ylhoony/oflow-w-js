class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.company_id :integer

      t.timestamps
    end
  end
end
