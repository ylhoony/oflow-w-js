class AccountOrderLine < ApplicationRecord
  belongs_to :account_order
  belongs_to :product

  def line_amount
    quantity * unit_price
  end
end
