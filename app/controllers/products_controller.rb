class ProductsController < ApplicationController
  before_action :require_signed_in?
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
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private

    def set_countries
      @countries = Country.active_countries
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
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
