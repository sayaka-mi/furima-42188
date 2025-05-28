FactoryBot.define do
  factory :address do
    post_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    block { "MyString" }
    building_name { "MyString" }
    phone_number { "MyString" }
    purchase { nil }
  end
end
