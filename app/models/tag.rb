class Tag < ApplicationRecord
  belongs_to :company
  has_many :products_tags
  has_many :products, through: :products_tags
end
