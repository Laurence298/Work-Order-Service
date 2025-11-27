class Employee < ApplicationRecord
  belongs_to :company
  has_many :service_assignments
  has_many :requested_services, through: :service_assignments

  validates :first_name, :last_name, :phone_number, presence: true
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
