class WarehousesController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]

  def index
    @warehouses = current_company.warehouses.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @warehouses, status: 201 }
    end
  end

  def new
    
  end

  def create
    @warehouse = current_company.warehouses.build(warehouse_params)
    @warehouse.save
    respond_to do |format|
      format.html { redirect_to warehouses_path }
      format.json { render json: @warehouse, status: 201 }
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @warehouse, status: 201 }
    end
  end

  def edit
    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @warehouse, status: 201 }
    end
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
