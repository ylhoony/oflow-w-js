class CurrenciesController < ApplicationController
  before_action :require_signed_in?
  before_action :set_currency, only: [:edit, :update]

  def index
    @currencies = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      redirect_to currencies_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @currency.update(currency_params)
      redirect_to currencies_path
    else
      render :edit
    end
  end

  def switch
    currency = Currency.find(params[:id])
    currency.active? ? currency.update(active: false) : currency.update(active: true)
    redirect_to currencies_path, notice: "Status is updated successfully."
  end

  private

    def set_currency
      @currency = Currency.find(params[:id])
    end

    def currency_params
      params.require(:currency).permit(:name, :code_alpha, :code_numeric, :active)
    end

end
