require "rails_helper"

RSpec.describe EmployeesFilterQuery do
  describe "#call" do
    it "filters employees by country" do
      india_employee =
        create(:employee, country: "India")

      create(:employee, country: "USA")

      result =
        described_class.new(
          Employee.all,
          country: "India"
        ).call

      expect(result)
        .to contain_exactly(india_employee)
    end
  end
end
