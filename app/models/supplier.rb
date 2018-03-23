class Supplier < Account
  has_many :purchase_orders, foreign_key: "account_id"
end