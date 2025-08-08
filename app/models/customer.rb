class Customer < ApplicationRecord
  belongs_to :company
  has_one :address, dependent: :destroy
  has_many :requested_services, dependent: :destroy
  has_many :services, through: :requested_services

  validates :name, :email, presence: true
end
