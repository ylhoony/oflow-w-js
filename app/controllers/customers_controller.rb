class CustomersController < ApplicationController
  before_action :require_signed_in?
  before_action :set_required_data, except: [:index, :destroy]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    @customers = current_company.customers.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :new
    end
  end

  def destroy
    @customer.delete
    redirect_to customers_path
  end

  private

    def set_required_data
      @currencies = Currency.active_currencies
      @warehouses = current_company.warehouses.where(active: true)
      @payment_terms = current_company.payment_terms.where(active: true)
    end

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(
        :company_id,
        :name,
        :currency_id,
        :payment_term_id,
        :warehouse_id,
        :tax_id_number,        
        :comment,
        :active)
    end

end