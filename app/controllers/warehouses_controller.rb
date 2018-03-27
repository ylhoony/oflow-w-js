class WarehousesController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def index
    @warehouses = current_company.warehouses.all
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to warehouses_path
    else
      render :new
    end
  end

  def destroy
    @warehouse.delete
    redirect_to warehouses_path
  end

  private

    def require_valid_access?
      redirect_to warehouses_path unless current_company.warehouse_ids.include?(params[:id].to_i)
    end

    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
      params.require(:warehouse).permit(
        :company_id,
        :name,
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
        :active)
    end

end
