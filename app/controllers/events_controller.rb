class EventsController < ApplicationController

    def index
        # @events = Event.all
        @events = Event.all(:order => 'start_time ASC', :conditions => ['start_time >= ?',DateTime.now])
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

        if params[:event][:date] != "" && params[:event][:start_time] != ""
            actual_date = DateTime.strptime(params[:event][:date],'%d %B %Y')
            actual_time = DateTime.strptime(params[:event][:start_time],'%l:%M%P')
            params[:event][:start_time] = DateTime.new(actual_date.year,actual_date.mon,actual_date.mday,actual_time.hour,actual_time.min)
        end
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

        if params[:event][:date] != "" && params[:event][:start_time] != ""
            actual_date = DateTime.strptime(params[:event][:date],'%d %B %Y')
            actual_time = DateTime.strptime(params[:event][:start_time],'%l:%M%P')
            params[:event][:start_time] = DateTime.new(actual_date.year,actual_date.mon,actual_date.mday,actual_time.hour,actual_time.min)
        end

        logger.error {"zxc"}
        logger.error {params[:event]}

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
        logger.error{'zxc'}
        @event = Event.find(params[:id])
        @event.destroy

        respond_to do |format|
            format.html { redirect_to events_url }
            format.json { head :no_content }
        end
    end
end
