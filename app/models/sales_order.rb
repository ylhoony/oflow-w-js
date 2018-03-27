class SalesOrder < AccountOrder
  belongs_to :account_address
  belongs_to :customer, foreign_key: :account_id
  belongs_to :company_address
  belongs_to :order_status

  def account_order_lines_attributes=(order_lines)
    self.account_order_lines.delete_all if account_order_lines.present?
    order_lines.map do |i, line|
      self.account_order_lines.build(line) unless line[:quantity].to_f === 0
    end
  end

  def ship_so
    self.account_order_lines.each do |line|
      inventory = Inventory.where("warehouse_id = ? AND product_id = ?", warehouse_id, line.product_id)[0]
      if inventory.present?
        inventory.update(quantity: inventory.quantity - line.quantity, total_value: inventory.total_value - inventory.total_value / inventory.quantity * line.quantity )
      else
        Inventory.create(company_id: customer.company_id, product_id: line.product.id, warehouse_id: warehouse_id, quantity: -(line.quantity), total_value: 0 )
      end
    end
  end

  def self.so(current_company)
    current_company.sales_orders
  end

  def self.sales_by_product(current_company)
    self.so(current_company)
      .joins(account_order_lines: :product)
      .group("products.sku")
      .order("total_sales DESC")
      .select("products.sku, products.name, SUM(account_order_lines.quantity) AS total_quantity, SUM(account_order_lines.unit_price* account_order_lines.quantity) AS total_sales")
  end

  # Same Result testing in SQL statement:
  # SELECT products.sku, SUM(account_order_lines.unit_price * account_order_lines.quantity) FROM account_orders
  # INNER JOIN account_order_lines on account_orders.id = account_order_lines.account_order_id
  # INNER JOIN products on account_order_lines.product_id = products.id
  # where account_orders.type = "SalesOrder"
  # GROUP BY products.sku;

end