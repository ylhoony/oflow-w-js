class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  private

    def country_params
      # params.require(:country).permit(:name)
    end

end
