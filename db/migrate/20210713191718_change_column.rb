class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :locale, :string
  end
  def down
    change_column :users, :locale, :integer
  end
end
