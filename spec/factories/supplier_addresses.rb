# frozen_string_literal: true

FactoryBot.define do
  factory :supplier_address do
    address { Faker::JapaneseMedia::DragonBall.character }
    number { 12 }
    district { Faker::JapaneseMedia::DragonBall.planet }
    cities_id { 1 }
    states_id { 25 }
    zipcode { '44100-000' }

    association :supplier
  end
end
