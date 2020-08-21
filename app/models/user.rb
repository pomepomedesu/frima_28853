class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,        presence: true
  validates :email,                 presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :password,              presence: true, confirmation: true, length: {minimum: 6}, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :password_confirmation, presence: true
  with_options presence: true do
    validates :first_name,      format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name,       format: {with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birth_day 
  end
end
