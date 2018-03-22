class ProductGroupsController < ApplicationController
  before_action :require_signed_in?
  before_action :set_product_group, only: [:edit, :update]

  def index
    @product_groups = current_company.product_groups.all
  end

  def new
    @product_group = ProductGroup.new
  end

  def create
    @product_group = ProductGroup.new(product_group_params)
    if @product_group.save
      redirect_to product_groups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_group.update(product_group_params)
      redirect_to product_groups_path
    else
      render :new
    end
  end

  def switch
    product_group = ProductGroup.find(params[:id])
    product_group.active? ? product_group.update(active: false) : product_group.update(active: true)
    redirect_to product_groups_path, notice: "Status is updated successfully."
  end

  private

    def set_product_group
      @product_group = ProductGroup.find(params[:id])
    end

    def product_group_params
      params.require(:product_group).permit(:company_id, :product_category_id, :name, :active)
    end

end
