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

end