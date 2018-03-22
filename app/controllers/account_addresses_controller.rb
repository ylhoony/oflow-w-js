class AccountAddressesController < ApplicationController
  before_action :require_signed_in?
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
      redirect_to customer_path(@account)
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
      redirect_to customer_account_address_path(@account, @account_address)
    else
      render :edit
    end
  end

  def destroy
    @account_address.delete
    redirect_to customer_account_addresses_path(@account)
  end

  private

    def set_account
      @account = Account.find(params[:customer_id])
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
