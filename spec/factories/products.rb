# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    sku { Faker::Lorem.characters(number: 6) }

    association :supplier
  end
end
