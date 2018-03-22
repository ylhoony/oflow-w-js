class ProductGroup < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true, uniqueness: { scope: :product_category_id }
end
