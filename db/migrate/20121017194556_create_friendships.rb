class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :rush_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
