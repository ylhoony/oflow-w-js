class OrderStatus < ApplicationRecord
  has_many :sales_orders
end
