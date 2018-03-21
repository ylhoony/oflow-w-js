class PaymentTerm < ApplicationRecord
  belongs_to :company
  belongs_to :payment_option

  validates :name, presence: true
end
