class DropTimestampsFromFrienship < ActiveRecord::Migration
  def change_table
      remove_column(:friendships, :created_at)
      remove_column(:friendships, :updated_at)
    end
end
