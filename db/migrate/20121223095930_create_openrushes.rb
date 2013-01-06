class CreateOpenrushes < ActiveRecord::Migration
  def change
    create_table :openrushes do |t|
      t.string :name
      t.string :photo
      t.string :email
      t.string :phone
      t.string :residence
      t.string :year

      t.timestamps
    end
  end
end
