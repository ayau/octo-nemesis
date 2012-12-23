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

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @openrush }
        end
    end

    # GET /openrushes/1/edit
    def edit
        @openrush = Openrush.find(params[:id])
    end

    # POST /openrushes
    # POST /openrushes.json
    def create
        @openrush = Openrush.new(params[:openrush])

        respond_to do |format|
            if @openrush.save
                format.html { redirect_to @openrush, notice: 'Openrush was successfully created.' }
                format.json { render json: @openrush, status: :created, location: @openrush }
            else
                format.html { render action: "new" }
                format.json { render json: @openrush.errors, status: :unprocessable_entity }
            end
        end
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
        @openrush.destroy

        respond_to do |format|
            format.html { redirect_to openrushes_url }
            format.json { head :no_content }
        end
    end
end
