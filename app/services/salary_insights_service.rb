class SalaryInsightsService
  def self.average_salary
    Employee.average(:salary)
  end
end
