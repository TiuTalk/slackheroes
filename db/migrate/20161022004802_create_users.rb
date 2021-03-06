class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid, uniqueness: true
      t.string :name
      t.string :username
      t.string :title
      t.string :avatar

      t.timestamps
    end
  end
end
