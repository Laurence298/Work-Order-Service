class ServiceDetail < ApplicationRecord
  belongs_to :service

  validates :service_plan, :features, :price, presence: true
end
