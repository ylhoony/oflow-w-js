class CompaniesController < ApplicationController

  def index
    @companies = current_user.companies.all
  end

  def new
    @company = Company.new
    @currencies = Currency.active_currencies
    @countries = Country.active_countries
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

    def company_params
      # params.require(:company).permit(:name)
    end

end
