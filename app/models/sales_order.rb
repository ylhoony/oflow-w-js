class SalesOrder < AccountOrder
  belongs_to :account_address
  belongs_to :customer, foreign_key: :account_id
  belongs_to :company_address
  belongs_to :order_status
end