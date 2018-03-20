class CompaniesController < ApplicationController
  before_action :require_signed_in?
  before_action :set_foreign_lists, only: [:new, :create, :edit, :update]
  before_action :set_company, only: [:edit, :update]

  def index
    @companies = current_user.companies.all
  end

  def new
    @company = Company.new
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
    if @company.update(company_params)
      redirect_to companies_path
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

    def set_company
      @company = current_user.companies.find_by(id: params[:id])
    end

    def set_foreign_lists
      @currencies = Currency.active_currencies
      @countries = Country.active_countries
    end

    def company_params
      params.require(:company).permit(:name, :currency_id, :country_id, :active)
    end

end
