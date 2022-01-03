# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { Faker::Fantasy::Tolkien.character }
  end
end
