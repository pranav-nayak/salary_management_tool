class EmployeesController < ApplicationController
  def index
  end

  def create
    Employee.create!(employee_params)

    redirect_to employees_path
  end

  private

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
