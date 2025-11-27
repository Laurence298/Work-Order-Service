class Company < ApplicationRecord
  belongs_to :user
  has_many :customers, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :requested_services, dependent: :destroy
  has_many :employees, dependent: :destroy

  validates :company_name, :city, :province, :country, presence: true
end
