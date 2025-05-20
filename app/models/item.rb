class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee_burden
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :image, :name, :description, :condition_id, :shopping_fee_burden_id, :prefecture_id, :delivery_time_id, :price, presence: true
  validates :category_id, :condition_id, :shopping_fee_burden_id, :prefecture_id, :delivery_time_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
