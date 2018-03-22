class SuppliersController < ApplicationController
  before_action :require_signed_in?
  before_action :set_required_data, except: [:index, :destroy]
  before_action :set_warehouse, only: [:show, :edit, :update, :destroy]


  def index
    @suppliers = current_company.suppliers.all
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

    def set_required_data
      # @currencies = Currency.active_currencies
      # @warehouse = Warehouse.active_warehouses(current_company)

    end

    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(
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