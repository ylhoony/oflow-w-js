class PaymentOptionsController < ApplicationController
  before_action :require_signed_in?
  before_action :set_payment_option, only: [:edit, :update]

  def index
    @payment_options = PaymentOption.all
  end

  def new
    @payment_option = PaymentOption.new
  end

  def create
    @payment_option = PaymentOption.new(payment_option_params)
    if @payment_option.save
      redirect_to payment_options_path
    else
      render :new
    end    
  end

  def edit
  end

  def update
    if @payment_option.update(payment_option_params)
      redirect_to payment_options_path
    else
      render :edit
    end 
  end

  def switch
    payment_option = PaymentOption.find(params[:id])
    payment_option.active? ? PaymentOption.update(active: false) : PaymentOption.update(active: true)
    redirect_to payment_options_path, notice: "Status is updated successfully."
  end

  private

    def set_payment_option
      @payment_option = PaymentOption.find(params[:id])
    end

    def payment_option_params
      params.require(:payment_option).permit(:name, :active)
    end

end
