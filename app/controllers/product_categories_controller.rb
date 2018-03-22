class ProductCategoriesController < ApplicationController
  before_action :require_signed_in?
  before_action :set_product_category, only: [:edit, :update]

  def index
    @product_categories = current_company.product_categories.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to product_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_category.update(product_category_params)
      redirect_to product_categories_path
    else
      render :new
    end
  end

  def switch
    product_category = ProductCategory.find(params[:id])
    product_category.active? ? product_category.update(active: false) : product_category.update(active: true)
    redirect_to product_categories_path, notice: "Status is updated successfully."
  end

  private

    def set_product_category
      @product_category = ProductCategory.find(params[:id])
    end

    def product_category_params
      params.require(:product_category).permit(:name, :company_id, :active,
        product_groups_attributes: [
          :name, :active
        ])
    end

end
