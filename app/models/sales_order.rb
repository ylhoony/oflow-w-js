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

end