class DashboardController < ApplicationController
  def index
    @country_stats =
      SalaryInsightsService.country_salary_stats

    @total_employees =
      SalaryInsightsService.total_employees

    @highest_salary =
      SalaryInsightsService.highest_salary

    @lowest_salary =
      SalaryInsightsService.lowest_salary

    @average_salary =
      SalaryInsightsService.average_salary
  end
end
