class RushesController < ApplicationController
    def new
        @rush = Rush.new
    end
    def create
        @rush = Rush.new(params[:rush])
        if @rush.save
            redirect_to @rush
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
    end
end
