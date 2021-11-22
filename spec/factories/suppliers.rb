FactoryBot.define do
  factory :supplier do
    corporate_name { Faker::Company.name }
    fantasy_name { Faker::Fantasy::Tolkien.character }
    cnpj { Faker::Company.brazilian_company_number }
  end
end
