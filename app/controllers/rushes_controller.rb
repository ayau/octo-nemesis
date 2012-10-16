class RushesController < ApplicationController
    def new
        @rush = Rush.new
    end
    def create
        @rush = Rush.new(params[:rush])
        @rush.phone = @rush.phone.gsub(/[^0-9]/i, '')
        if (@rush.phone.length == 10)
            if @rush.save
                redirect_to @rush
            elsif Rush.find_by_phone(@rush.phone)
                redirect_to Rush.find_by_phone(@rush.phone)
            else
                render 'new'
            end
        else
            render 'new'
        end
    end
    def show
        @rush = Rush.find(params[:id])
        @rush_comments = @rush.rush_comments
        @rush_comment = RushComment.new
    end
    def index
        @rushes = Rush.find :all
    end
end
