class SuppliersController < ApplicationController

  def index
    @suppliers = current_company.suppliers.all
  end

  def new
    
  end

  def create

  end

  def show
    
  end

  def edit

  end

  def update
    
  end

  def destroy
    
  end

  private

    def supplier_params
      
    end
  
end