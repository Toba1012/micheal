class User < ApplicationRecord
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true , length: { in: 1..15 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { in: 8..32 }, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true
  
  has_secure_password
  
  has_many :topics
end
