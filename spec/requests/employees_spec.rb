require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it "returns successful response" do
      get employees_path

      expect(response)
        .to have_http_status(:success)
    end
  end

  describe "POST /employees" do
    it "creates employee" do
      expect {
        post employees_path,
            params: {
              employee: {
                first_name: "John",
                last_name: "Doe",
                email: "john@example.com",
                country: "India",
                job_title: "Engineer",
                department: "Engineering",
                salary: 100000
              }
            }
      }.to change(Employee, :count).by(1)
    end
  end
end
