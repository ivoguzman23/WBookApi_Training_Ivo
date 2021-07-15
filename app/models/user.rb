# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :first_name, :last_name, :email, :password, :password_confirmation, :locale, presence: true
  has_many :rents
  has_many :book_suggestion
end
