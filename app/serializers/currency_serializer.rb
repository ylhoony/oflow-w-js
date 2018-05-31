class CurrencySerializer < ActiveModel::Serializer
  has_many :company
  
  attributes :id, :name, :code_alpha, :code_numeric, :active
end
