class AddPrimaryContactIdToRushes < ActiveRecord::Migration
  def change
    add_column :rushes, :primary_contact_id, :integer
  end
end
