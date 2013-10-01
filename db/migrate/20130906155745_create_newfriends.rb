class CreateNewfriends < ActiveRecord::Migration
  def change
    create_table :newfriends do |t|
      t.references :user, index: true
      t.integer :friend_id

      t.timestamps
    end
  end
end
