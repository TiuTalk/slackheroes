class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :slack_id
      t.string :name
      t.string :domain
      t.string :email_domain
      t.string :image
      t.string :token

      t.timestamps
    end
  end
end
