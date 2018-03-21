class PaymentOption < ApplicationRecord
  has_many :payment_terms

  validates :name, presence: true, uniqueness: true

  def self.active_payment_options
    where(active: true)
  end
end
