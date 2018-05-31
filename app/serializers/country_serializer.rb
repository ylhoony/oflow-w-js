class CountrySerializer < ActiveModel::Serializer
  has_many :company
  
  attributes :id, :alpha_2_code, :alpha_3_code, :numeric_code, :active
end
