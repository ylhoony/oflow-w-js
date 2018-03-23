class Warehouse < ApplicationRecord
  belongs_to :company
  belongs_to :country
  has_many :accounts
  has_many :sales_orders

  validates :name, presence: true

end
