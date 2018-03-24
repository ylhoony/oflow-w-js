class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_group
  belongs_to :unit_of_measure
  has_many :account_order_lines
  has_many :inventories
  has_many :products_tags
  has_many :tags, through: :products_tags

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def sku_with_name
    "#{sku} : #{name}"
  end
end
