class ProductSerializer < ActiveModel::Serializer
  belongs_to :company
  belongs_to :product_group
  belongs_to :unit_of_measure
  # has_many :product_tags
  has_many :tags

  attributes :id, :sku, :name, :price
end
