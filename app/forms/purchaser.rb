class Purchaser

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:buyer_id, :postal_code, :prefecture_id, :city, :house_number, :building_name,:phone_number

  

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :buyer_id
    validates :postal_code,  format: {with: VALID_CODE_REGEX, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number,   format: { with: VALID_PHONE_REGEX }
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,buyer_id: buyer.id, phone_number: phone_number)
  end
end