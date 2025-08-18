class ServiceDetail < ApplicationRecord
  belongs_to :service
  belongs_to :requested_service, optional: true
end
