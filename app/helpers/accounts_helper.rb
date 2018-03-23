module AccountsHelper

  def active_customers
    current_company.customers.all
  end

end
