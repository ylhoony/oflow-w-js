class PurchaseOrder < AccountOrder
  belongs_to :account_address
  belongs_to :supplier, foreign_key: :account_id
  belongs_to :company_address
  belongs_to :order_status

  def account_order_lines_attributes=(order_lines)
    self.account_order_lines.delete_all if account_order_lines.present?
    order_lines.map do |i, line|
      self.account_order_lines.build(line) unless line[:quantity].to_f === 0
    end
  end

  def receive_po
    self.account_order_lines.each do |order_line|
      inventory = Inventory.where("warehouse_id = ? AND product_id = ?", warehouse_id, order_line.product_id)[0]
      if inventory.present?
        inventory.update(quantity: inventory.quantity + order_line.quantity, total_value: inventory.total_value + order_line.quantity * order_line.unit_price )
      else
        Inventory.create(company_id: supplier.company_id, product_id: order_line.product.id, warehouse_id: warehouse_id, quantity: order_line.quantity, total_value: order_line.quantity * order_line.unit_price )
      end
    end
  end

end