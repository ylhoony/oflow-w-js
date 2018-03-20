class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_company

  def current_company
    current_user.current_company
  end

  def require_signed_in?
    return redirect_to new_user_session_path unless user_signed_in?
  end

  def is_valid_employee?
    !!current_user.company_ids.include?(params[:id].to_i) && !!current_user.employees.find_by(company_id: params[:id])
  end

  def require_access_to_company?
    return redirect_to companies_path unless is_valid_employee?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

end
