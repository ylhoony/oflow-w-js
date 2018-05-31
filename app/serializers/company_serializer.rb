class CompanySerializer < ActiveModel::Serializer
  belongs_to :country
  belongs_to :currency
  has_many :product_categories
  has_many :products
  has_many :tags
  has_many :unit_of_measures

  attributes :id, :name, :active
end
