require 'rails_helper'

RSpec.describe "Employees", type: :request do
  describe "GET /employees" do
    it "returns successful response" do
      get employees_path

      expect(response)
        .to have_http_status(:success)
    end
  end
end
