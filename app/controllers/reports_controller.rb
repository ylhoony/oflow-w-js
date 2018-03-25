class ReportsController < ApplicationController

  def sales_by_product
    @sales = SalesOrder.sales_by_product
    # SalesOrder.joins(account_order_lines: :product).group(:sku)
    render "sales_by_product"
  end
  
end