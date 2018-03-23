class Warehouse < ApplicationRecord
  belongs_to :company
  belongs_to :country
  has_many :accounts
  has_many :inventories
  has_many :sales_orders
  has_many :purchase_orders

  validates :name, presence: true

end
