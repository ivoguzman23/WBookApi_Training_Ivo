# frozen_string_literal: true

FactoryBot.define do
  factory :book_suggestion do
    editorial { Faker::Company.name }
    price { Faker::Number.decimal(l_digits: 2) }
    author { Faker::Book.author }
    title { Faker::Book.title }
    link { 'www.link.com' }
    publisher { Faker::Company.name }
    year { Faker::Number.number(digits: 10).to_s }
  end
end
