class Product < ApplicationRecord
  belongs_to :company
  belongs_to :product_group
  belongs_to :unit_of_measure
  has_many :account_order_lines
  has_many :inventories
  has_many :product_tags
  has_many :tags, through: :product_tags
  accepts_nested_attributes_for :tags

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def sku_with_name
    "#{sku} : #{name}"
  end

  def tags_attributes=(tag_attributes)
    tag_attributes.values.each do |tag_attribute|
      if tag_attribute[:name].present?
        tag = company.tags.find_by(tag_attribute)
        if tag.present?
          self.tags << tag
        else
          new_tag = company.tags.create(tag_attribute)
          self.tags << new_tag
        end
      end
    end
  end

end
