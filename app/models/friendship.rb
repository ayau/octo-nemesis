# == Schema Information
#
# Table name: friendships
#
#  id        :integer          not null, primary key
#  rush_id   :integer
#  friend_id :integer
#

class Friendship < ActiveRecord::Base
  attr_accessible :friend_id, :rush_id
end
