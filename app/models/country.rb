class Country < ApplicationRecord
  has_many :companies

  validates :name, presence: true, uniqueness: true
  validates :alpha_2_code, presence: true, uniqueness: true
  validates :alpha_3_code, presence: true, uniqueness: true
  validates :numeric_code, presence: true, uniqueness: true

end
