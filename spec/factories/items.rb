FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { '商品の説明です。' }
    price { 500 }
    category_id { 2 }
    condition_id { 2 }
    shopping_fee_burden_id { 2 }
    prefecture_id { 2 }
    delivery_time_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
