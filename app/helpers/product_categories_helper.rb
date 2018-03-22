module ProductCategoriesHelper

  def active_product_categories
    current_company.product_categories.where(active: true)
  end

end
