class Company < ApplicationRecord
  belongs_to :country
  belongs_to :currency
  has_many :customers, class_name: "Customer"
  has_many :suppliers, class_name: "Supplier"
  has_many :company_addresses
  has_many :company_contacts
  has_many :employees
  has_many :freight_terms
  has_many :users, through: :employees
  has_many :payment_terms
  has_many :products
  has_many :product_categories
  has_many :product_groups, through: :product_categories
  has_many :unit_of_measures
  has_many :warehouses

  has_many :sales_orders, through: :customers
  # has_many :account_orders, through: :suppliers, class_name: "PurchaseOrder"

  validates :name, presence: true
  validates :country_id, presence: true
  validates :currency_id, presence: true
end
