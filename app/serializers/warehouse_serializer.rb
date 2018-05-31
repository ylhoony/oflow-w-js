class WarehouseSerializer < ActiveModel::Serializer
  belongs_to :company
  belongs_to :country

  attributes :id, :name, :attention, :address_line_1,
             :address_line_2, :city, :state, :postal_code,
             :email, :phone, :fax, :active
end
