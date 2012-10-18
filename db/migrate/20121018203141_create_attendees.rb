class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.integer :event_id
      t.integer :rush_id

      t.timestamps
    end

    add_index :attendees, :event_id
    add_index :attendees, :rush_id
    add_index :attendees, [:event_id, :rush_id], unique: true
  end
end
