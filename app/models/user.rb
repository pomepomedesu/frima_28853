class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/
  VALID_ZENKAKU_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_KATAKANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :email,                  uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password,               confirmation: true, format: { with: PASSWORD_REGEX}
    validates :password_confirmation
    validates :birth_day
    
    with_options format: {with: VALID_ZENKAKU_NAME_REGEX} do
      validates :first_name                                
      validates :last_name                                
    end

    with_options format: {with: VALID_KATAKANA_NAME_REGEX} do
      validates :first_name_kana                           
      validates :last_name_kana  
    end
  end
end
