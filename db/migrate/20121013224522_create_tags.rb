class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :tag_id
      t.string :type
      t.string :text

      t.timestamps
    end
  end
end
