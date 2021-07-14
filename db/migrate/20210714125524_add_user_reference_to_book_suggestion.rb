class AddUserReferenceToBookSuggestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :book_suggestions, :user, foreign_key: true
  end
end
