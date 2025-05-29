class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building_name, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :city, :block
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      block: block,
      building_name: building_name,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end