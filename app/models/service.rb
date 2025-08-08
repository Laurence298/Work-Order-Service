class Service < ApplicationRecord
  belongs_to :company
  has_many :service_details, dependent: :destroy
  has_many :requested_services, dependent: :destroy
  has_many :customers, through: :requested_services
end
