# == Schema Information
#
# Table name: attendees
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  rush_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :rush_id, :user_id

  belongs_to :rush, class_name: "Rush"
  belongs_to :event, class_name: "Event"

  validates :event_id, presence: true
  validates :rush_id, presence: true

end
