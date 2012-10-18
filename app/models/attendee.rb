class Attendee < ActiveRecord::Base
  attr_accessible :event_id, :rush_id

  belongs_to :rush, class_name: "Rush"
  belongs_to :event, class_name: "Event"

  validates :event_id, presence: true
  validates :rush_id, presence: true

end
