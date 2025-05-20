class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  validates :name, :description, :category_id, :condition_id, :shopping_fee_burden_id, :prefecture_id, :delivery_time_id, :price, presence: true
end
