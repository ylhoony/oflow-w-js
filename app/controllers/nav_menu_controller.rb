class NavMenuController < ApplicationController
  before_action :require_signed_in?, except: [:index]

  def index
    if user_signed_in?
      current_company ? redirect_to(nav_dashboard_path) : redirect_to(companies_path)
    else
      redirect_to new_user_session_path
    end
  end

  def dashboard
    current_user.current_company = Company.find(params[:id]) if params[:id]
    # redirect_to root_path
  end

  def demand
    
  end

  def supply
    
  end

  def product
    
  end

  def warehouse
    
  end

  def logistics
    
  end

  def report
    
  end

  def setup
    
  end

end
