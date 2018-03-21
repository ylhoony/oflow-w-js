class Warehouse < ApplicationRecord
  belongs_to :company
  belongs_to :country
  has_many :accounts
end
