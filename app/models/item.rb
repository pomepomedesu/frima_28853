class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    VALID_PRICE_REGEX = /\A[a-zA-Z0-9]+\z/
    validates :image
    validates :name,               length: {maximum: 40}
    validates :writings,           length: {maximum: 1000}
    validates :price,              format: {with: VALID_PRICE_REGEX}
    validates :user_id
    validates :category_id
    validates :condition_id
    validates :sipping_charges_id
    validates :prefecture_id
    validates :delivery_days_id
  end
end
