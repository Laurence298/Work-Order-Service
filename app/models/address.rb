class Address < ApplicationRecord
    belongs_to :customer
    has_many :requested_services

    validates :street, :city, :province, :postal_code, :country, presence: true
end
