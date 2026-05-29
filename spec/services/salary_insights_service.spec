require "rails_helper"

RSpec.describe SalaryInsightsService do
  describe ".average_salary" do
    it "returns average salary" do
      create(:employee, salary: 100)
      create(:employee, salary: 300)

      result =
        described_class.average_salary

      expect(result.to_f)
        .to eq(200.0)
    end
  end
end
