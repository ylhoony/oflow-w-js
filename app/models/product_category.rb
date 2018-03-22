class ProductCategory < ApplicationRecord
  belongs_to :company
  has_many :product_groups

  validates :name, presence: true, uniqueness: true

  def product_groups_attributes=(product_groups)
    product_groups.each do |i, product_group|
      self.product_groups.find_by(name: product_group[:name]) || self.product_groups.build(product_group)
    end
    self.save
  end

end
