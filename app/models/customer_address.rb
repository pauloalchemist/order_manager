class CustomerAddress < ApplicationRecord
  belongs_to :customer

  validates :address, :number, :district, :zipcode, presence: true
end
