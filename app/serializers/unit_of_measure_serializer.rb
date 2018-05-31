class UnitOfMeasureSerializer < ActiveModel::Serializer
  belongs_to :company
  has_many :products

  attributes :id, :name, :active
end
