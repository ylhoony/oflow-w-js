class CompanyAddress < ApplicationRecord
  belongs_to :country
  belongs_to :company
  has_many :sales_orders

  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :name, presence: true
  validates :state, presence: true
end
