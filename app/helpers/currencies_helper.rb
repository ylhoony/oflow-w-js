module CurrenciesHelper
  def active_currencies
    Currency.active_currencies
  end
end
