class AddTeamAssociations < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :team_id, :integer
    add_column :custom_emojis, :team_id, :integer
    add_column :user_reactions, :team_id, :integer
  end
end
