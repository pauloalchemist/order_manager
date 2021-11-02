FactoryBot.define do
  factory :addressfornecedor do
    address { "MyString" }
    number { "MyString" }
    district { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zipcode { "MyString" }
    supplier { nil }
  end
end
