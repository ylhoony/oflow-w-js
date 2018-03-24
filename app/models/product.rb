class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_group
  belongs_to :unit_of_measure
  has_many :account_order_lines
  has_many :inventories

  def sku_with_name
    "#{sku} : #{name}"
  end
end
