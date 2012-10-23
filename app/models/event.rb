# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  start_time  :datetime
#  end_time    :datetime
#  photo       :string(255)
#  date        :text
#

class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :start_time, :end_time, :photo

    has_many :attendees, dependent: :destroy
    has_many :rushes, through: :attendees
    
    def rush_attending?(rush)
        self.attendees.find_by_rush_id(rush.id)
    end



end
