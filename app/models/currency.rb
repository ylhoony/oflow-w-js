class Currency < ApplicationRecord
  has_many :companies

  def self.active_currencies
    Currency.where(active: true)
  end
  
end
