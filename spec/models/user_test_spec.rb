# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it do
    should validate_presence_of(:first_name)
  end

  it do
    should validate_presence_of(:last_name)
  end

  subject(:user) do
    build(:user)
  end

  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the first_name is nil' do
      subject(:user) do
        build(:user, first_name: nil)
      end

      it 'is not valid' do
    User.new(
      first_name: first_name, last_name: last_name, email: email, password: password,
      password_confirmation: password_confirmation
    )
  end

  let(:first_name)            { Faker::Name.first_name }
  let(:last_name)             { Faker::Name.last_name }
  let(:email)                 { Faker::Internet.email }
  let(:password)              { 'password' }
  let(:password_confirmation) { 'password' }

  it do
    is_expected.to be_valid
  end
  #   describe '#generate_verification_code' do
  #     context 'When the user is created' do
  #       it 'generates a random verification code' do
  #         user.save!
  #         expect(user.verification_code).to be_present
  #       end
  #     end
  #   end
  describe '#create' do
    context 'When the first_name is nil' do
      let(:first_name) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the last_name is nil' do
      subject(:user) do
        build(:user, last_name: nil)
      end

      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the email is nil' do
      subject(:user) do
        build(:user, email: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the password is nil' do
      subject(:user) do
        build(:user, password: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the password_confirmation is nil' do
      subject(:user) do
        build(:user, password_confirmation: nil)
      end
      it 'is not valid' do
      let(:last_name) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
