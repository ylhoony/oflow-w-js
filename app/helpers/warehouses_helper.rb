module WarehousesHelper

  def active_warehouses
    current_company.warehouses.where(active: true)
  end

end
