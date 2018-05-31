class ProductGroupSerializer < ActiveModel::Serializer
  belongs_to :product_category
  has_many :products
  
  attributes :id, :name, :active
end
