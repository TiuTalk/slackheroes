class RemoveActioFromUserReaction < ActiveRecord::Migration[5.0]
  def up
    remove_column :user_reactions, :action
  end

  def down
    add_column :user_reactions, :action, :integer
  end
end
