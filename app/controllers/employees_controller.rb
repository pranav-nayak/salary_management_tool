class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path, notice: "Employee created successfully"
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employees_path,
                  notice: "Employee updated successfully"
    else
      render :edit,
             status: :unprocessable_content
    end
  end

  def destroy
    @employee.destroy

    redirect_to employees_path, notice: "Employee deleted successfully"
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(
      :first_name,
      :last_name,
      :email,
      :country,
      :job_title,
      :department,
      :salary,
      :currency,
      :date_of_joining,
      :status
    )
  end
end
