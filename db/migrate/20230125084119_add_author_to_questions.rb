class AddAuthorToQuestions < ActiveRecord::Migration[7.0]
  def up
    add_column :questions, :author_id, :integer
    add_index :questions, :author_id
  end

  def down
    remove_index :questions, :author_id
    remove_column :questions, :author_id, :integer
  end
end
