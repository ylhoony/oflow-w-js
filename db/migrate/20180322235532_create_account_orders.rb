class CreateAccountOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :account_orders do |t|
      t.string :ref_number

      t.timestamps
    end
  end
end
