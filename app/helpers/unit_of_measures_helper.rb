module UnitOfMeasuresHelper

  def active_uoms
    current_company.unit_of_measures.where(active: true)
  end

end
