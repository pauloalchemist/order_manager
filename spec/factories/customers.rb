FactoryBot.define do
  factory :customer do
    name { Faker::Fantasy::Tolkien.character }
    cnpj { '00.000.000/0000-00' }
    email { Faker::Internet.free_email(name: name.to_s) }
  end
end
