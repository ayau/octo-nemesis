class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :rush_id

      t.timestamps
    end
  end
end
