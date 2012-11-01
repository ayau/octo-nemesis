class Forcomments < ActiveRecord::Migration
  def up
    change_column :rush_comments, :text, :text, :limit => nil
  end

  def down
    change_table :rush_comments do |t|
        t.change :text, :text
    end
  end
end
