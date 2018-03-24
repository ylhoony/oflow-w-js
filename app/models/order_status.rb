class OrderStatus < ApplicationRecord
  has_many :sales_orders

  validates :name, presence: true
end
