class CreateAccountOrderLines < ActiveRecord::Migration[5.1]
  def change
    create_table :account_order_lines do |t|
      t.account_order_id :integer

      t.timestamps
    end
  end
end
