class ChangeColumnNavColorToUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :nav_color, :string, :default => '#370617'
  end

  def down
    change_column_default :users, :nav_color, from: '#370617', to: ''
  end
end
