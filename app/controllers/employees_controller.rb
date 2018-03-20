class EmployeesController < ApplicationController

  def index
    @employees = current_company.employees.all
  end

  def new
    @employee = Employee.new
    @users = User.all
  end

  def create
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
    
  end

  def destroy
    
  end

  def switch
    employee = Employee.find(params[:id])
    employee.active? ? employee.update(active: false) : employee.update(active: true)
    redirect_to employees_path, notice: "Status is updated successfully."
  end

  private

    def employee_params
      params.require(:employee).permit(:user_id, :company_id, :job_title, :active)
    end

end
