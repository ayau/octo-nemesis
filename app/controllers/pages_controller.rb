class PagesController < ApplicationController	

    def home
        @rushes = Rush.order("RANDOM()").limit(4)
        @events = Event.all
    end

    def loggedout
    end
end
