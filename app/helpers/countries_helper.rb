module CountriesHelper

  def active_countries
    Country.active_countries
  end
end
