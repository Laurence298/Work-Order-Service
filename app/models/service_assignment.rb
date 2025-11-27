class ServiceAssignment < ApplicationRecord
  belongs_to :employee
  belongs_to :requested_service
end
