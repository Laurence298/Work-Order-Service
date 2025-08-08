class RequestedService < ApplicationRecord
  belongs_to :customer
  belongs_to :service
  belongs_to :company
  belongs_to :address

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :customer
end
