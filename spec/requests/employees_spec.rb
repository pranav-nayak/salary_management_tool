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

  describe "PATCH /employees/:id" do
    let(:employee) { create(:employee) }

    let(:valid_attributes) do
      {
        first_name: "Jane",
        last_name: "Doe",
        email: "jane@example.com",
        country: "India",
        job_title: "Developer",
        department: "Engineering",
        salary: 120000
      }
    end

    let(:invalid_attributes) do
      {
        first_name: "",
        last_name: "Doe",
        email: employee.email,
        country: employee.country,
        job_title: employee.job_title,
        department: employee.department,
        salary: employee.salary
      }
    end

    it "updates the employee and redirects to the employee list" do
      patch employee_path(employee), params: { employee: valid_attributes }

      expect(response).to redirect_to(employees_path)
      expect(flash[:notice]).to eq("Employee updated successfully")
      expect(employee.reload.first_name).to eq("Jane")
      expect(employee.reload.email).to eq("jane@example.com")
    end

    it "renders the edit template when the update is invalid" do
      patch employee_path(employee), params: { employee: invalid_attributes }

      expect(response).to have_http_status(422)
      expect(response.body).to include("Edit Employee")
      expect(employee.reload.first_name).to eq("John")
    end
  end

  describe "DELETE /employees/:id" do
    let!(:employee) { create(:employee) }

    it "destroys the employee and redirects to the employee list" do
      expect {
        delete employee_path(employee)
      }.to change(Employee, :count).by(-1)

      expect(response).to redirect_to(employees_path)
      expect(flash[:notice]).to eq("Employee deleted successfully")
    end
  end
end
