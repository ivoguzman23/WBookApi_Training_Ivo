# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
  has_many :rents
end
