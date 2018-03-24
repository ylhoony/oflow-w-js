class PurchaseOrdersController < ApplicationController
  before_action :require_signed_in?
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @purchase_orders = current_company.purchase_orders.all
  end

  def new
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.save
      redirect_to purchase_order_path(@purchase_order)
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @purchase_order.update(purchase_order_params)
      @purchase_order.receive_po if @purchase_order.order_status_id == 2
      redirect_to purchase_order_path(@purchase_order)
    else
      render :new
    end
  end

  def destroy
    @purchase_order.delete
    redirect_to purchase_orders_path
  end

  private

    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    def purchase_order_params
      params.require(:purchase_order).permit(
        :company_address_id,
        :warehouse_id,
        :account_id,
        :account_address_id,
        :reference,
        :comment,
        :order_status_id,
        account_order_lines_attributes: [
          :product_id,
          :comment,
          :unit_price,
          :quantity]
      )
    end

end