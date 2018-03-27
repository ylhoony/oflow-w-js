module PaymentTermsHelper
  def active_payment_terms
    current_company.payment_terms.where(active: true)
  end
end
