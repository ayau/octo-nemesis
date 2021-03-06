class PagesController < ApplicationController	

    def home
        @rushes = Rush.where(:active => 1).order("RANDOM()").limit(4)
        @events = Event.all(:order => 'start_time ASC', :conditions => ['start_time >= ?',DateTime.now], :limit => 4)
    end

    def loggedout
    end
end
