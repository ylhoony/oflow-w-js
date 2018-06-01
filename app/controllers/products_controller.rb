class ProductsController < ApplicationController
  before_action :require_signed_in?
  before_action :require_valid_access?, only: [:show, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = current_company.products.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product, status: 201 }
    end
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private

    def require_valid_access?
      redirect_to products_path unless current_company.product_ids.include?(params[:id].to_i)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :company_id,
        :product_group_id,
        :sku,
        :name,
        :price,
        :unit_of_measure_id,
        tag_ids: [],
        tags_attributes: [:name])
      end

end
