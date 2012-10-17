class CreateCpratings < ActiveRecord::Migration
  def change
    create_table :cpratings do |t|
      t.integer :user_id
      t.integer :rush_id
      t.integer :chill
      t.integer :pull

      t.timestamps
    end
  end
end
