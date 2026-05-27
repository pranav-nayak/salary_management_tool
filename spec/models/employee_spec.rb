require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject { build(:employee) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it do
    should validate_uniqueness_of(:email)
  end
  it { should validate_presence_of(:salary) }
  it do
    should validate_numericality_of(:salary)
      .is_greater_than(0)
  end

  describe "#full_name" do
    it "returns combined first and last name" do
      employee = build(
        :employee,
        first_name: "John",
        last_name: "Doe"
      )

      expect(employee.full_name)
        .to eq("John Doe")
    end
  end
end
