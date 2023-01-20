class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, [:nickname, :email], unique: true
  end
end
