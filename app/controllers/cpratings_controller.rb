class CpratingsController < ApplicationController
    def new
    end

    def create
        @cprating = Cprating.new(params[:cprating])
        @cprating.save
        redirect_to Rush.find(@cprating.rush_id)
    end
end
