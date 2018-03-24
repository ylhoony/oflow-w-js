class Currency < ApplicationRecord
  has_many :accounts
  has_many :companies

  validates :name, presence: true, uniqueness: true
  validates :code_alpha, length: { is: 3 }, presence: true, uniqueness: true
  validates :code_numeric, length: { is: 3 }, presence: true, uniqueness: true

  def self.active_currencies
    Currency.where(active: true)
  end
  
end
