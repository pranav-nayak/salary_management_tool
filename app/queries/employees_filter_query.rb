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

    if @params[:job_title].present?
      employees = employees.where(
        job_title: @params[:job_title]
      )
    end

    if @params[:search].present?
      employees = employees.where(
        "first_name LIKE :query OR last_name LIKE :query",
        query: "%#{@params[:search]}%"
      )
    end

    employees
  end
end
