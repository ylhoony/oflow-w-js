class CountrySerializer < ActiveModel::Serializer
  has_many :company
  has_many :warehouses
  
  attributes :id, :alpha_2_code, :alpha_3_code, :numeric_code, :active
end
