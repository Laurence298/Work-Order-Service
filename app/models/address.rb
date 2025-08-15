class Address < ApplicationRecord
    belongs_to :customer

    validates :street, :city, :province, :postal_code, :country, presence: true
end
