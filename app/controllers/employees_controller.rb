class EmployeesController < ApplicationController
  before_action :require_signed_in?
  before_action :set_users, only: [:new, :create, :edit, :update]
  before_action :set_employee, only: [:edit, :update]

  def index
    @employees = current_company.employees.all
  end

  def new
    @employee = Employee.new
  end

  def create
    # raise params.inspect
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :new
    end
  end

  def destroy
    
  end

  def switch
    employee = Employee.find(params[:id])
    employee.active? ? employee.update(active: false) : employee.update(active: true)
    redirect_to employees_path, notice: "Status is updated successfully."
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_users
      @users = User.all
    end

    def employee_params
      params.require(:employee).permit(:user_id, :company_id, :job_title, :active)
    end

end
