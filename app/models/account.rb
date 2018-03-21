class Account < ApplicationRecord
  # belongs_to :company

  scope :customers, -> { where(type: "Customer") }
  scope :suppliers, -> { where(type: "Supplier") }

end
