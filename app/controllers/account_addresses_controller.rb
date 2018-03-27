class AccountAddressesController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?
  before_action :set_account
  before_action :set_account_address, only: [:show, :edit, :update, :destroy]

  def index
    @account_addresses = @account.account_addresses.all
  end

  def new
    @account_address = @account.account_addresses.build
  end

  def create
    @account_address = @account.account_addresses.build(account_address_params)
    if @account_address.save
      redirect_to customer_path(@account) if @account.class.eql?(Customer)
      redirect_to supplier_path(@account) if @account.class.eql?(Supplier)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @account_address.update(account_address_params)
      redirect_to customer_account_address_path(@account, @account_address) if @account.class.eql?(Customer)
      redirect_to supplier_account_address_path(@account, @account_address) if @account.class.eql?(Supplier)
    else
      render :edit
    end
  end

  def destroy
    @account_address.delete
    redirect_to customer_account_addresses_path(@account)
  end

  private

    def require_valid_access?
      if params[:customer_id]
        redirect_to customers_path unless current_company.customer_ids.include?(params[:customer_id].to_i)
      elsif params[:supplier_id]
        redirect_to suppliers_path unless current_company.supplier_ids.include?(params[:supplier_id].to_i)
      end
    end

    def set_account
      if params[:customer_id].present?
        @account = Customer.find(params[:customer_id])
      elsif params[:supplier_id].present?
        @account = Supplier.find(params[:supplier_id])
      end
    end

    def set_account_address
      @account_address = @account.account_addresses.find { |addr| params[:id].to_i == addr.id }
    end

    def account_address_params
      params.require(:account_address).permit(
        :account_id,
        :company_name,
        :attention,
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :country_id,
        :postal_code,
        :email,
        :phone,
        :fax,
        :comment,
        :active)
    end

end
