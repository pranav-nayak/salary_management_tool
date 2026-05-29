require 'rails_helper'

RSpec.describe "dashboard/index.html.erb", type: :view do
  let(:country_stat_class) do
    Struct.new(:country, :employee_count, :min_salary, :max_salary, :avg_salary)
  end

  before do
    assign(:total_employees, 42)
    assign(:average_salary, 75000)
    assign(:highest_salary, 95000)
    assign(:lowest_salary, 40000)
    assign(:country_stats, [
      country_stat_class.new("India", 12, 40000, 95000, 75000)
    ])

    render
  end

  it "renders the dashboard summary and country stats" do
    expect(rendered).to include("Salary Insights Dashboard")
    expect(rendered).to include("Total Employees")
    expect(rendered).to include("42")
    expect(rendered).to include("Average Salary")
    expect(rendered).to include("$75000")
    expect(rendered).to include("Highest Salary")
    expect(rendered).to include("Lowest Salary")
    expect(rendered).to include("India")
    expect(rendered).to include("12")
    expect(rendered).to include("$40000")
    expect(rendered).to include("$95000")
  end
end
