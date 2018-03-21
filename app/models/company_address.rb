class CompanyAddress < ApplicationRecord
  belongs_to :country
  belongs_to :company
end
