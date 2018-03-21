class PaymentOption < ApplicationRecord
  has_many :payment_terms

  validates :name, presence: true, uniqueness: true
end
