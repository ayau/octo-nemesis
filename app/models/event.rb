class Event < ActiveRecord::Base
  attr_accessible :date, :description, :location, :name

    has_many :attendees, dependent: :destroy
    has_many :rushes, through: :attendees

    def rush_attending?(rush)
        self.attendees.find_by_rush_id(rush.id)
    end

end
