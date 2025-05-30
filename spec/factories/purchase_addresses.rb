FactoryBot.define do
  factory :purchase_address do
    post_code { "123-4567" }
    prefecture_id { 2 }
    city { "東京都" }
    block { "1-1" }
    building_name { "ビルディング" }
    phone_number { "09012345678" }
    
    user_id{create(:user).id}
    item_id{create(:item).id}
  end
end
