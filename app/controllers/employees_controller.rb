class EmployeesController < ApplicationController

  def index
    @employees = current_company.employees.all
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

  def switch
    employee = Employee.find(params[:id])
    employee.active? ? employee.update(active: false) : employee.update(active: true)
    redirect_to employees_path, notice: "Status is updated successfully."
  end

  private

    def employee_params
      # params.require(:employee).permit(:)
    end

end
