class RequestedService < ApplicationRecord
  belongs_to :customer
  belongs_to :service
  belongs_to :company
  has_one :service_detail, dependent: :destroy

  accepts_nested_attributes_for :customer
  accepts_nested_attributes_for :service_detail
end
