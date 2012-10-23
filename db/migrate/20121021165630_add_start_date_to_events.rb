class AddStartDateToEvents < ActiveRecord::Migration
    def change
        add_column :events, :date, :text
    end
end
