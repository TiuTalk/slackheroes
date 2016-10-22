class RenameEmojiToCustomEmoji < ActiveRecord::Migration[5.0]
  def change
    rename_table :emojis, :custom_emojis
  end
end
