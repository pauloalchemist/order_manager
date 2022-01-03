# frozen_string_literal: true

FactoryBot.define do
  factory :city do
    name { Faker::Fantasy::Tolkien.character }
    association :state, factory: :state
  end
end
