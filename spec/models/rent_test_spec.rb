require 'rails_helper'

describe Rent, type: :model do
  it do
    should validate_presence_of(:from)
  end

  it do
    should validate_presence_of(:to)
  end

  it do
    should validate_presence_of(:user_id)
  end

  it do
    should validate_presence_of(:book_id)
  end

  subject(:rent) do
    build(:rent)
  end

  it 'is valid' do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the from is nil' do
      subject(:rent) do
        build(:rent, from: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the to is nil' do
      subject(:rent) do
        build(:rent, to: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the user_id is nil' do
      subject(:rent) do
        build(:rent, user_id: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end

    context 'When the book_id is nil' do
      subject(:rent) do
        build(:rent, book_id: nil)
      end
      it 'is not valid' do
        is_expected.to be_invalid
      end
    end
  end
end
