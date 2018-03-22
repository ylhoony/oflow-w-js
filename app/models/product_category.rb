class ProductCategory < ApplicationRecord
  belongs_to :company
  has_many :product_groups

  validates :name, presence: true
end
