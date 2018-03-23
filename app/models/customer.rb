class Customer < Account
  belongs_to :company

  has_many :sales_orders, class_name: "SalesOrder", foreign_key: "account_id"

end