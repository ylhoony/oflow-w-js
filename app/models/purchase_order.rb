class PurchaseOrder < AccountOrder
  belongs_to :account_address
  belongs_to :supplier, foreign_key: :account_id
  belongs_to :company_address
  belongs_to :order_status
end