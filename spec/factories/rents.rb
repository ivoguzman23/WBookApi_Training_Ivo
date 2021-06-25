FactoryBot.define do
  factory :rent do
    from { Faker::Date.between(from: '2021-06-23', to: '2021-06-24') }
    to { Faker::Date.between(from: '2021-06-25', to: '2021-06-26') }
    user_id { '1' }
    book_id { '1' }
  end
end
