class Account < ApplicationRecord
  scope :customers, -> { where(type: "Customer") }
  scope :suppliers, -> { where(type: "Supplier") }

  belongs_to :currency
  belongs_to :payment_term
  belongs_to :warehouse

end
