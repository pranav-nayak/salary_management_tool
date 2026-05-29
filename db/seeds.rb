# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding employees..."

Employee.delete_all

first_names = File.readlines(
  Rails.root.join("db/seeds/first_names.txt")
).map(&:strip)

last_names = File.readlines(
  Rails.root.join("db/seeds/last_names.txt")
).map(&:strip)

COUNTRIES = [
  "India",
  "USA",
  "Germany",
  "Canada",
  "Australia"
]

JOB_TITLES = [
  "Software Engineer",
  "Engineering Manager",
  "HR Manager",
  "Product Manager",
  "Designer"
]

DEPARTMENTS = [
  "Engineering",
  "HR",
  "Design",
  "Product"
]

employees = []

start_time = Time.current

10_000.times do |i|
  first = first_names.sample
  last = last_names.sample

  employees << {
    first_name: first,
    last_name: last,
    email: "#{first.downcase}.#{last.downcase}#{i}@company.com",
    country: COUNTRIES.sample,
    job_title: JOB_TITLES.sample,
    department: DEPARTMENTS.sample,
    salary: rand(40_000..250_000),
    currency: "USD",
    status: 0,
    date_of_joining: rand(5.years).seconds.ago.to_date,
    created_at: Time.current,
    updated_at: Time.current
  }
end

Employee.insert_all(employees)

puts "Seeded #{Employee.count} employees"
puts "Completed in #{Time.current - start_time} seconds"
