class CreateUserReactions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_reactions do |t|
      t.references :user, foreign_key: true
      t.references :emoji, foreign_key: true
      t.string :message_uid, index: true
      t.string :action, index: true

      t.timestamps
    end
  end
end
