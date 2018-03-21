class PaymentTerm < ApplicationRecord
  belongs_to :company
  belongs_to :payment_option
  has_many :accounts

  validates :name, presence: true
end
