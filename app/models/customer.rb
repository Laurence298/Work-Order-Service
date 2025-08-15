class Customer < ApplicationRecord
  belongs_to :company
  has_one :address, dependent: :destroy
  has_many :requested_services, dependent: :destroy

  accepts_nested_attributes_for :address
end
