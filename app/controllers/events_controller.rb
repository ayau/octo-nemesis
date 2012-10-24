class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    # GET /events/1/edit
    def edit
        @event = Event.find(params[:id])
    end

    # POST /events
    # POST /events.json
    def create
        @event = Event.new(params[:event])
        
        respond_to do |format|
            if @event.save
                format.html { redirect_to events_path, notice: 'Event was successfully created.' }
            else
                format.html { render action: "new" }
            end
        end
    end

    # PUT /events/1
    # PUT /events/1.json
    def update
        @event = Event.find(params[:id])

        respond_to do |format|
            if @event.update_attributes(params[:event])
                format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /events/1
    # DELETE /events/1.json
    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        respond_to do |format|
            format.html { redirect_to events_url }
            format.json { head :no_content }
        end
    end
end
