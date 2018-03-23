class AccountAddress < ApplicationRecord
  belongs_to :account
  belongs_to :country
  has_many :sale_orders

  def name_with_account
    "#{account.name} : #{company_name}"
  end
end
