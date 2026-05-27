class Employee < ApplicationRecord
  enum :status, {
    active: 0,
    inactive: 1
  }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: true

  validates :country, presence: true
  validates :job_title, presence: true
  validates :department, presence: true

  validates :salary,
            presence: true,
            numericality: {
              greater_than: 0
            }

  def full_name
    "#{first_name} #{last_name}"
  end
end
