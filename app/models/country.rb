class Country < ApplicationRecord
  has_many :companies

  validates :name, presence: true, uniqueness: true
  validates :alpha_2_code, length: { is: 2 }, presence: true, uniqueness: true
  validates :alpha_3_code, length: { is: 3 }, presence: true, uniqueness: true
  validates :numeric_code, length: { is: 3 }, presence: true, uniqueness: true

end
