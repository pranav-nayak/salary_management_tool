class EmployeesFilterQuery
  def initialize(scope, params)
    @scope = scope
    @params = params
  end

  def call
    employees = @scope

    if @params[:country].present?
      employees =
        employees.where(country: @params[:country])
    end

    employees
  end
end
