class SalesOrder < AccountOrder
  # belongs_to :account
  belongs_to :customer
end