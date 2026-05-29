class SalaryInsightsService
  def self.average_salary
    Employee.average(:salary)
  end

  def self.country_salary_stats
    Employee
      .group(:country)
      .select(
        :country,
        "MIN(salary) as min_salary",
        "MAX(salary) as max_salary",
        "AVG(salary) as avg_salary",
        "COUNT(*) as employee_count"
      )
  end

  def self.average_salary_by_job_title(country)
    Employee
      .where(country: country)
      .group(:job_title)
      .average(:salary)
  end

  def self.total_employees
    Employee.count
  end

  def self.highest_salary
    Employee.maximum(:salary)
  end

  def self.lowest_salary
    Employee.minimum(:salary)
  end
end
