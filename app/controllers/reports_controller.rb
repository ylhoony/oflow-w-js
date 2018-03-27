class ReportsController < ApplicationController

  def sales_by_product
    @sales = SalesOrder.sales_by_product(current_company)
    render "sales_by_product"
  end
  
end




