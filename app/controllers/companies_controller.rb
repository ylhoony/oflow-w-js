class CompaniesController < ApplicationController
  before_action :require_signed_in?
  before_action :set_company, only: [:edit, :update]

  def index
    @companies = current_user.companies.all
  end

  def new
    @company = Company.new
    @currencies = Currency.active_currencies
    @countries = Country.active_countries
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      @company.employees.create(user_id: current_user.id, admin: true, active: true)
      current_user.current_company = @company
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

    def set_company
      
    end

    def company_params
      params.require(:company).permit(:name, :currency_id, :country_id, :active)
    end

end
