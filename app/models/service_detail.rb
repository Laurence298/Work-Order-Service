class ServiceDetail < ApplicationRecord
  belongs_to :service
  belongs_to :requested_service, optional: true

  scope :templates, -> { where(requested_service_id: nil) }
end
