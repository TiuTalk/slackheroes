class ChangeUserFromUserReaction < ActiveRecord::Migration[5.0]
  def up
    rename_column(:user_reactions, :user_id, :user_sender_id)
    add_column(:user_reactions, :user_receiver_id, :integer, null: false)
    add_foreign_key(:user_reactions, :users, column: :user_receiver_id)
    add_index(:user_reactions, :user_receiver_id )
  end

  def down
    rename_column(:user_reactions, :user_sender_id, :user_id)
    remove_foreign_key(:user_reactions, column: :user_receiver_id)
    remove_index(:user_reactions, :user_receiver_id )
    remove_column(:user_reactions, :user_receiver_id)
  end
end
