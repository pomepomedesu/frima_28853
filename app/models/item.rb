class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :sipping_charge, :prefecture, :delivery_day

  with_options presence: true do
    VALID_PRICE_REGEX = /\A[a-zA-Z0-9]+\z/
    validates :image
    validates :name,               length: {maximum: 40}
    validates :writings,           length: {maximum: 1000}
    validates :price,              format: {with: VALID_PRICE_REGEX }
    validates :user_id
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :condition_id
        validates :sipping_charges_id
        validates :prefecture_id
        validates :delivery_days_id
      end
  end

  belongs_to :user
  has_one_attached :image
end
