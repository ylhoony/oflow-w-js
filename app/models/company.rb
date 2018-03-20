class Company < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  has_many :employees
  has_many :users, through: :employees

  validates :name, presence: true
  validates :country_id, presence: true
  validates :currency_id, presence: true

end
