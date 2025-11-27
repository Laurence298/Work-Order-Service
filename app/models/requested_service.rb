class RequestedService < ApplicationRecord
  belongs_to :customer
  belongs_to :service
  belongs_to :company
  has_one :service_detail, dependent: :destroy

  has_many :service_assignments, dependent: :destroy
  has_many :employees, through: :service_assignments

  validates :required_employees_count, numericality: { greater_than: 0 }

  belongs_to :service_tier, class_name: "ServiceDetail", optional: true
  
  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :service_detail

  validate :tier_belongs_to_service

  def plan_name
    service_detail&.service_plan || service_tier&.service_plan
  end

  def description
    service_detail&.description || service_tier&.description
  end

  def price
    service_detail&.price || service_tier&.price
  end

  private

  def tier_belongs_to_service
    if service_tier.present? && service_tier.service_id != service_id
      errors.add(:service_tier, "must belong to the selected service")
    end
  end
end
