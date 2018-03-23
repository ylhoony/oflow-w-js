class AccountOrder < ApplicationRecord
  scope :sales_orders, -> { where(type: "SalesOrder") }
  scope :purchase_orders, -> { where(type: "PurchaseOrder") }
end
