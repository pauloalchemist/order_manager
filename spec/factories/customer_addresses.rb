# frozen_string_literal: true

FactoryBot.define do
  factory :customer_address do
    address { Faker::Address.street_name }
    number { Faker::Address.building_number }
    district { Faker::Books::Lovecraft.location }
    zipcode { Faker::Address.zip_code }
    cities_id { 100 }
    states_id { 162 }

    association :customer
  end
end
