class AddRushToOpenRush < ActiveRecord::Migration
    def change
        add_column :openrushes, :rush_id, :integer
    end
end
