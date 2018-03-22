module ProductGroupsHelper

  def active_product_groups
    current_company.product_groups.where(active: true)
  end

end
