# == Schema Information
#
# Table name: cpratings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  rush_id    :integer
#  chill      :integer
#  pull       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cprating < ActiveRecord::Base
    attr_accessible :chill, :pull, :rush_id, :user_id
    belongs_to :user
    belongs_to :rush
end
