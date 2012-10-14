class CreateRushes < ActiveRecord::Migration
  def change
    create_table :rushes do |t|
      t.string :name
      t.string :photo
      t.string :email
      t.string :phone
      t.string :residence
      t.string :origin

      t.timestamps
    end
  end
end
