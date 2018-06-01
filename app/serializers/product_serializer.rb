class ProductSerializer < ActiveModel::Serializer
  belongs_to :company
  # belongs_to :product_category
  belongs_to :product_group
  belongs_to :unit_of_measure
  has_many :tags

  attributes :id, :sku, :name, :price
end
