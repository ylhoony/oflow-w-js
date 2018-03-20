class CountriesController < ApplicationController
  before_action :set_country, only: [:edit, :update]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to countries_path
    else
      render :edit
    end
  end

  def switch
    country = Country.find(params[:id])
    country.active? ? country.update(active: false) : country.update(active: true)
    redirect_to countries_path, notice: "Status is updated successfully."
  end

  private

    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :alpha_2_code, :alpha_3_code, :numeric_code, :active)
    end

end
