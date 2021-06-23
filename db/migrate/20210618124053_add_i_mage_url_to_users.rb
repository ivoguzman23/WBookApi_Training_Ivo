# frozen_string_literal: true

class AddIMageUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_url, :string
    add_column :users, :locale, :integer
  end
end
