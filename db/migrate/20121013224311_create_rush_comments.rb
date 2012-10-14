class CreateRushComments < ActiveRecord::Migration
  def change
    create_table :rush_comments do |t|
      t.integer :user_id
      t.integer :rush_id
      t.integer :tag_id
      t.string :text

      t.timestamps
    end
  end
end
