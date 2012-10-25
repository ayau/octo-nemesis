class ChangeDataTypeForEventDescription < ActiveRecord::Migration
  def up
    change_column :events, :description, :text, :limit => nil
  end

  def down
    change_table :events do |t|
        t.change :description, :string
    end
  end
end
