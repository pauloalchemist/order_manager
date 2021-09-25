FactoryBot.define do
  factory :user do
    first_name { 'Ryu' }
    last_name { 'Shoriuken' }
    email { "#{first_name}.#{last_name}@figther.com".downcase }
    password { 'super12345678910' }
  end
end
