class UnitOfMeasure < ApplicationRecord
  belongs_to :company
  has_many :products

  validates :name, presence: true
end
