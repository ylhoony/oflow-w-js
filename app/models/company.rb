class Company < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  has_many :employees
  has_many :users, through: :employees

end
