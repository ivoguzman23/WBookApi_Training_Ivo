# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :from, :to, :user_id, :book_id, presence: true
end
