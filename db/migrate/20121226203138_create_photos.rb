class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :rush_id
      t.text :photo_url

      t.timestamps
    end
  end
end
