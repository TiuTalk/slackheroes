class ChangeEmojiFromUserReaction < ActiveRecord::Migration[5.0]
  def up
    remove_foreign_key(:user_reactions, :custom_emojis)
    rename_column(:user_reactions, :emoji_id, :emoji)
    change_column(:user_reactions, :emoji, :string, limit: 80, null: false)
  end

  def down
    rename_column(:user_reactions, :emoji, :emoji_id)
    change_column(:user_reactions, :emoji_id, :integer, null: true)
    add_foreign_key(:user_reactions, :custom_emojis)
  end
end
