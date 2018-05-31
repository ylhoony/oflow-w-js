class CountrySerializer < ActiveModel::Serializer
  has_many :companies
  has_many :warehouses
  
  attributes :id, :name, :alpha_2_code, :alpha_3_code, :numeric_code, :active
end
