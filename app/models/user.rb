# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  devise :omniauthable, omniauth_providers: [:google_oauth2]
  validates :first_name, :last_name, :email, :password, :locale, presence: true
  has_many :rents
  has_many :book_suggestion

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    puts data

    user ||= User.create(first_name: data['first_name'],
                         email: data['email'],
                         last_name: data['last_name'],
                         locale: 'es',
                         image_url: data['image'],
                         password: Devise.friendly_token[0, 20])
    user
  end
end
