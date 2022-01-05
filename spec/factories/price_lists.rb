# frozen_string_literal: true

FactoryBot.define do
  factory :price_list do
    price { 1.00 }

    association :product
  end
end
