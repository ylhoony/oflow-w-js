class TagSerializer < ActiveModel::Serializer
  belongs_to :company
  has_many :product_tags

  attributes :id, :name
end
