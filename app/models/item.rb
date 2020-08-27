class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day


  with_options presence: true do
    VALID_PRICE_REGEX = /\A[a-zA-Z0-9]+\z/
    validates :image
    validates :name,               length: {maximum: 40}
    validates :writings,           length: {maximum: 1000}
    validates :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with: VALID_PRICE_REGEX }
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :shipping_charge_id
        validates :prefecture_id
        validates :delivery_day_id
      end
  end   

  belongs_to :user
  has_one :buyer
  has_one_attached :image
  has_many :category
  has_many :condition
  has_many :delivery_day
  has_many :prefecture
  has_many :shipping_charge
end
