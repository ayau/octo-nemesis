class OpenrushesController < ApplicationController
    # GET /openrushes
    # GET /openrushes.json
    def index
        @openrushes = Openrush.all

        respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @openrushes }
        end
    end

    # GET /openrushes/1
    # GET /openrushes/1.json
    def show
        @openrush = Openrush.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @openrush }
        end
    end

    # GET /openrushes/new
    # GET /openrushes/new.json
    def new
        @openrush = Openrush.new        

        # respond_to do |format|
        #     format.html # new.html.erb
        #     format.json { render json: @openrush }
        # end
    end

    # GET /openrushes/1/edit
    def edit
        @openrush = Openrush.find(params[:id])
    end

    # POST /openrushes
    # POST /openrushes.json
    def create
        @openrush = Openrush.new(params[:openrush])

        @openrush.photo = ''

        @openrush.phone = @openrush.phone.gsub(/[^0-9]/i, '')
        @rush = Rush.find_by_phone(@openrush.phone)
        if @rush
        else
            @rush = Rush.find_by_name(@openrush.name)
        end
        if @rush
        else
            @rush = Rush.new
            @rush.name = @openrush.name
            @rush.phone = @openrush.phone
            @rush.save
        end
        @openrush.rush_id = @rush.id
        @old_openrush = Openrush.find_by_rush_id(@openrush.rush_id)
        if @old_openrush
            @old_openrush.update_attribute(:rush_id, nil)
        end

        if params[:openrush][:photo]
            if !(@rush.has_data_photo)
                photo = Photo.new
                photo.photo_url = params[:openrush][:photo]
                photo.rush_id = @openrush.rush_id
                photo.save
                @rush.update_attribute(:has_data_photo, 1)
            end
        end

        @openrush.save

        redirect_to root_url + "snrush"



        # respond_to do |format|
        #     if @openrush.save
        #         format.html { redirect_to @openrush, notice: 'Openrush was successfully created.' }
        #         format.json { render json: @openrush, status: :created, location: @openrush }
        #     else
        #         format.html { render action: "new" }
        #         format.json { render json: @openrush.errors, status: :unprocessable_entity }
        #     end
        # end
    end

    # PUT /openrushes/1
    # PUT /openrushes/1.json
    def update
        @openrush = Openrush.find(params[:id])

        respond_to do |format|
            if @openrush.update_attributes(params[:openrush])
                format.html { redirect_to @openrush, notice: 'Openrush was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @openrush.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /openrushes/1
    # DELETE /openrushes/1.json
    def destroy
        @openrush = Openrush.find(params[:id])

        if is_admin?
            @openrush.destroy
        end

        respond_to do |format|
            format.html { redirect_to openrushes_url }
            format.json { head :no_content }
        end
    end
end
