class CompanyAddressesController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
  before_action :set_company_address, only: [:show, :edit, :update, :destroy]

  def index
    @company_addresses = current_company.company_addresses.all
  end

  def new
    @company_address = CompanyAddress.new
  end

  def create
    @company_address = CompanyAddress.new(company_address_params)
    if @company_address.save
      redirect_to company_addresses_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @company_address.update(company_address_params)
      redirect_to company_addresses_path
    else
      render :new
    end
  end

  def destroy
    @company_address.delete
    redirect_to company_addresses_path
  end

  private

    def require_valid_access?
      redirect_to company_addresses_path unless current_company.company_address_ids.include?(params[:id].to_i)
    end

    def set_company_address
      @company_address = CompanyAddress.find(params[:id])
    end

    def company_address_params
      params.require(:company_address).permit(
        :company_id,
        :name,
        :attention,
        :address_line_1,
        :address_line_2,
        :city,
        :state,
        :country_id,
        :postal_code,
        :phone,
        :email,
        :fax,
        :active)
    end

end
