class ChangeDataTypeForRushCommentText < ActiveRecord::Migration
  def up
    change_table :rush_comments do |t|
        t.change :text, :text
    end
  end

  def down
    change_table :rush_comments do |t|
        t.change :text, :string
    end
  end
end
