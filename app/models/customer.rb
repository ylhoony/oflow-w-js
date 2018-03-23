class Customer < Account
  has_many :sales_orders, foreign_key: "account_id"
end