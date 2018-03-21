class PaymentTermsController < ApplicationController
  before_action :require_signed_in?
  before_action :set_payment_options, only: [:new, :create, :edit, :update]
  before_action :set_payment_term, only: [:edit, :update]

  def index
    @payment_terms = current_company.payment_terms.all
  end

  def new
    @payment_term = PaymentTerm.new
    
  end

  def create
    @payment_term = PaymentTerm.new(payment_term_params)
    if @payment_term.save
      redirect_to payment_terms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @payment_term.update(payment_term_params)
      redirect_to payment_terms_path
    else
      render :new
    end
  end

  def switch
    payment_term = PaymentTerm.find(params[:id])
    payment_term.active? ? payment_term.update(active: false) : payment_term.update(active: true)
    redirect_to payment_terms_path, notice: "Status is updated successfully."
  end

  private

    def set_payment_options
      @payment_options = PaymentOption.active_payment_options
    end

    def set_payment_term
      @payment_term = PaymentTerm.find(params[:id])
    end

    def payment_term_params
      params.require(:payment_term).permit(:name, :company_id, :date_days, :payment_option_id, :trade_credit_percent, :trade_credit_days, :active)
    end

end
