class Warehouse < ApplicationRecord
  belongs_to :company
  has_many :accounts
end
