# frozen_string_literal: true

class CreateBookSuggestions < ActiveRecord::Migration[5.2]
  def up
    create_table :book_suggestions do |t|
      t.string :editorial
      t.float :price
      t.string :author
      t.string :title
      t.string :link
      t.string :publisher
      t.string :year

      t.timestamps
    end
  end

  def down
    drop_table :book_suggestions
  end
end
