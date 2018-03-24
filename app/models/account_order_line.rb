class AccountOrderLine < ApplicationRecord
  belongs_to :account_order
  belongs_to :product

  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than: 0 }

  def line_amount
    quantity * unit_price
  end
end
