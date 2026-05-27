FactoryBot.define do
  factory :employee do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    country { "MyString" }
    job_title { "MyString" }
    department { "MyString" }
    salary { "9.99" }
    currency { "MyString" }
    date_of_joining { "2026-05-27" }
    status { 1 }
  end
end
