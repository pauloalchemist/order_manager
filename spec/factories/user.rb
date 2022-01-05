# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Ryu' }
    last_name { 'Shoriuken' }
    email { "#{first_name}.#{last_name}@figther.com".downcase }
    password { 'supeR#12345678910' }
  end
end
