require 'rails_helper'

RSpec.describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、last＿name、
      first_name_kana、last_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "メールアドレスに@を含まれて、一意性であれば、登録できる" do
        @user = FactoryBot.build(:user, email: @user.email)
        expect(@user).to be_valid
      end

      it "passwordが６文字以上かつ、半角英数字混合で登録できる" do
        @user.password = "kai073"
        @user.password_confirmation = "kai073"
        expect(@user).to be_valid
      end
      it "first_nameが全角であれば登録できる" do
        @user.first_name = "加藤"
        expect(@user).to be_valid
      end

      it "last_nameが全角であれば登録できる" do
        @user.last_name = "海土"
        expect(@user).to be_valid
      end

      it "first_name_kanaがカタカナであれば登録できる" do
        @user.first_name_kana = "カトウ"
        expect(@user).to be_valid
      end

      it "last_name_kanaがカタカナであれば登録できる" do
        @user.last_name_kana = "カイト"
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it "nicknameが空では登録できない" do
        
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "メールアドレスに@を含まれないと登録できない" do
        @user.email = "kaitokaito"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字未満だと登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字混合出ないと登録できない" do
        @user.password = "00000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角でないと登録できない" do
        @user.first_name = "kaito"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが全角でないと登録できない" do
        @user.last_name = "kaito"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "first_name_kanaがカナでないと登録できない" do
        @user.first_name_kana = "加藤"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "last_name_kanaがカナでないと登録できない" do
        @user.last_name_kana = "海土"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it "birth_dayが空では登録できない" do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
