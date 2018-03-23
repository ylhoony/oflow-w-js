class CompanyAddress < ApplicationRecord
  belongs_to :country
  belongs_to :company
  has_many :sales_orders
end
