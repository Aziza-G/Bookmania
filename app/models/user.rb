class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :books, dependent: :destroy

  normalizes :email_address, with: ->(email) { email.strip.downcase }
end
