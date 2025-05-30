class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id, :item_id, :city, :block, :token
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  validates :phone_number, presence: true, numericality: { only_integer: true, message: 'is invalid. Input only number' }
  validates :phone_number, length: { minimum: 10, too_short: "is too short" }
  validates :phone_number, length: { maximum: 11, too_long: "is too long" }


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
