class CompaniesController < ApplicationController

  def index
    @companies = current_user.companies.all
  end

  def new
    
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
