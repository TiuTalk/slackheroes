class CreateEmojis < ActiveRecord::Migration[5.0]
  def change
    create_table :emojis do |t|
      t.string :name, unique: true, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
