class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  # has_one :purchase
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shopping_fee_burden
  belongs_to :prefecture
  belongs_to :delivery_time

  validates :image, :name, :description, :price, presence: true

  validates :category_id, :condition_id, :shopping_fee_burden_id, :prefecture_id, :delivery_time_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :price, numericality: {
    only_integer: true,
    message: 'is not a number'
  }, if: -> { errors[:price].empty? }

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    message: 'must be greater than or equal to 300'
  }, if: -> { errors[:price].empty? }
  
  validates :price, numericality: {
    less_than_or_equal_to: 9_999_999,
    message: 'must be less than or equal to 9999999'
  }, if: -> { errors[:price].empty? }

end