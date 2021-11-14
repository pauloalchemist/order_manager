FactoryBot.define do
  factory :customer do
    name { Faker::Fantasy::Tolkien.character }
    cnpj { Faker::Company.brazilian_company_number(formatted: true) }
    email { Faker::Internet.free_email(name: name.to_s) }
  end
end
