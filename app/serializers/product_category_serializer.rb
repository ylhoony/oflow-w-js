class ProductCategorySerializer < ActiveModel::Serializer
  belongs_to :company
  has_many :product_groups
  attributes :id, :name, :active
end
