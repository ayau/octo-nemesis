class AddHasDataPhotoToRush < ActiveRecord::Migration
    def change
        add_column :rushes, :has_data_photo, :boolean, :default => 0
    end
end
