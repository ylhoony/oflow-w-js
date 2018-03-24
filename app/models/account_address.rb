class AccountAddress < ApplicationRecord
  belongs_to :account
  belongs_to :country
  has_many :sale_orders

  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true

  def name_with_account
    "#{account.name} : #{company_name}"
  end
end
