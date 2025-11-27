class Service < ApplicationRecord
  belongs_to :company
  has_many :service_details, dependent: :destroy
  has_many :requested_services, dependent: :destroy
  has_many :customers, through: :requested_services

  has_many :service_tiers, -> { where(requested_service_id: nil) }, class_name: "ServiceDetail", dependent: :destroy
  accepts_nested_attributes_for :service_tiers, allow_destroy: true, reject_if: :all_blank
end
