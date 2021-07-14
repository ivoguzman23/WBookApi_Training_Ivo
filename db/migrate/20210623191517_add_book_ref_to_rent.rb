# frozen_string_literal: true

class AddBookRefToRent < ActiveRecord::Migration[5.2]
  def change
    add_reference :rents, :book, foreign_key: true
  end
end
