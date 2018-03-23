class AccountOrder < ApplicationRecord
  scope :sales_orders, -> { where(type: "SalesOrder") }
  scope :purchase_orders, -> { where(type: "PurchaseOrder") }

  belongs_to :warehouse
  # belongs_to :company_address
end
