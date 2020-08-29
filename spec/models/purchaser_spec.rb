require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  describe '購入者の保存' do
    before do
      @purchaser = FactoryBot.build(:purchaser)
    end

    it '全ての値が正しく入力されていれば保存できる'do
      expect(@purchaser).to be_valid
    end

    it 'クレジット情報が空だと保存できない' do
      @purchaser.token = nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が空だと保存できない' do
      @purchaser.postal_code = nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号がハイフンがないと保存できない' do
      @purchaser.postal_code = '3330803'
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefecture_idが空だと保存できない' do
      @purchaser.prefecture_id = nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが1以外でないと保存できない' do
      @purchaser.prefecture_id = '1'
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '住所の地域が空だと保存できない' do
      @purchaser.city = nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("City can't be blank")
    end

    it '建物の名前が、空でも保存できる' do
      @purchaser.building_name = nil
      expect(@purchaser).to be_valid
    end

    it '住所の番地が空だと保存できない' do
      @purchaser.house_number= nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空だと保存できない' do
      @purchaser.phone_number = nil
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が11桁以上だと保存できない' do
      @purchaser.phone_number= '111111111111'
      @purchaser.valid?
      expect(@purchaser.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
