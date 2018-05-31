class ProductTagSerializer < ActiveModel::Serializer
  belongs_to :product
  belongs_to :tag
  attributes :id
end
