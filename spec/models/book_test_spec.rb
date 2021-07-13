# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:genre)
  end

  it do
    should validate_presence_of(:author)
  end

  it do
    should validate_presence_of(:image)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:publisher)
  end
  
  it do
    should validate_presence_of(:year)
  end

  subject(:book) do
    Book.new(
      genre: genre, author: author, image: image, title: title,
      publisher: publisher, year: year
    )
  end

  let(:genre)            { Faker::Lorem.word }
  let(:author)           { Faker::Name.name }
  let(:image)            { Faker::Internet.domain_name }
  let(:title)            { Faker::Lorem.word }
  let(:publisher)        { Faker::Company.name }
  let(:year)             { Faker::Date }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the genre is nil' do
      let(:genre) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the image is nil' do
      let(:image) { nil }

      it do
        is_expected.to be_invalid
      end

    end

    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end

    end

    context 'When the publisher is nil' do
      let(:publisher) { nil }

      it do
        is_expected.to be_invalid
      end

    end

    context 'When the year is nil' do
      let(:year) { nil }

      it do
        is_expected.to be_invalid
      end
      
    end

  end
end
