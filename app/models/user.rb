class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX , message: 'Include both letters and numbers', allow_blank: true }

  validates :nickname,        presence: true
  validates :last_name,       format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/ }     
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }     
  validates :birthday,        presence: true

end
