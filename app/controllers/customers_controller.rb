class CustomersController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
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

    def require_valid_access?
      redirect_to customers_path unless current_company.customer_ids.include?(params[:id].to_i)
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