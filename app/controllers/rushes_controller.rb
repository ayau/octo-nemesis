class RushesController < ApplicationController
    def new
        @rush = Rush.new
    end
    def create
        @rush = Rush.new(params[:rush])
        @rush.phone = @rush.phone.gsub(/[^0-9]/i, '')
            if @rush.save
                redirect_to @rush
            elsif Rush.find_by_phone(@rush.phone)
                redirect_to Rush.find_by_phone(@rush.phone)
            else
                render 'new'
            end
    end
    def show
        @rush = Rush.find(params[:id])
        @average_pull = get_average_pull(@rush.cpratings)
        @average_chill = get_average_chill(@rush.cpratings)
        @cprating = Cprating.new
        @rush_comments = @rush.rush_comments
        @rush_comment = RushComment.new
    end
    def index
        @rushes = Rush.find :all
    end

    def get_average_pull(cpratings)
        total = 0
        for cp in cpratings
            total += cp.pull
        end
        return total/cpratings.length
    end

    def get_average_chill(cpratings)
        total = 0
        for cp in cpratings
            total += cp.chill
        end
        return total/cpratings.length
    end

end
