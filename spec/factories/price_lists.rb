# frozen_string_literal: true

FactoryBot.define do
  factory :price_list do
    price { 10.00 }

    association :product
  end
end
