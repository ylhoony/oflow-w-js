module AccountsHelper

  def active_customers
    current_company.customers.all
  end

  def active_suppliers
    current_company.suppliers.all
  end

end
