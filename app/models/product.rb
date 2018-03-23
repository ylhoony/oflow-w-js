class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_group
  belongs_to :unit_of_measure
  has_many :inventories
end
