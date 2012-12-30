class ChangeHasDataForPhotosToInteger < ActiveRecord::Migration
  def up
    change_column :rushes, :has_data_photo, :integer, :default => 0
  end

  def down
    change_column :rushes, :has_data_photo, :boolean, :default => 0
  end
end
