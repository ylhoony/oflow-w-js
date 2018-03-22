class AccountAddress < ApplicationRecord
  belongs_to :account
  belongs_to :country
end
