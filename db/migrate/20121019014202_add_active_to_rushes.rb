class AddActiveToRushes < ActiveRecord::Migration
  def change
    add_column :rushes, :active, :integer, :default => 1
  end
end
