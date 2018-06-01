class ProductCategorySerializer < ActiveModel::Serializer
  belongs_to :company
  has_many :product_groups
  has_many :products
  attributes :id, :name, :active
end
