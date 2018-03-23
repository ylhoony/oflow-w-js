module CompanyAddressesHelper

  def active_company_addresses
    current_company.company_addresses.where(active: true)
  end
end
