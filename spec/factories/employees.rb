FactoryBot.define do
  factory :employee do
    first_name { "John" }
    last_name { "Doe" }

    sequence(:email) do |n|
      "john#{n}@example.com"
    end

    country { "India" }
    job_title { "Software Engineer" }
    department { "Engineering" }

    salary { 100_000 }

    currency { "USD" }

    status { :active }
  end
end
