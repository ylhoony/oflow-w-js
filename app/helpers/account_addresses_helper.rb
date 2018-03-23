module AccountAddressesHelper

  def customer_addresses_list
    current_company.customers.map do |customer|
      customer.account_addresses
    end.flatten
  end

  def supplier_addresses_list
    current_company.suppliers.map do |supplier|
      supplier.account_addresses
    end.flatten
  end
  
end
