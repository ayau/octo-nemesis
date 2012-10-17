class CpratingsController < ApplicationController
    def new
    end

    def create
        @cprating = Cprating.new(params[:cprating])
        @cprating.save
        redirect_to Rush.find(@cprating.rush_id)
    end

    def edit
        @cprating = Cprating.find(params[:id])
        @cprating.update_attributes(params[:cprating])
        redirect_to Rush.find(@cprating.rush_id)  
    end
end
