class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :name, :description, :category_id, :condition_id, :shopping_fee_burden_id, :prefecture_id, :delivery_time_id, :price, presence: true
  validates :image, presence: true
end
