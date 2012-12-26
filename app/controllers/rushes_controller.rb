class RushesController < ApplicationController

    include RushesHelper

    def new
        @rush = Rush.new
    end

    def create
        @rush = Rush.new(params[:rush])
        @rush.phone = @rush.phone.gsub(/[^0-9]/i, '')
            if @rush.save
                redirect_to @rush
            elsif Rush.find_by_name(@rush.name)
                redirect_to Rush.find_by_name(@rush.name)
            else
                render :new
            end
    end

    def edit
        @rush = Rush.find(params[:id])
        @rush.update_attributes(params[:rush])
        redirect_to Rush.find(@rush.id)  
    end

    def show
        @rush = Rush.find(params[:id])
        @openrush = @rush.openrush

        if(@openrush)
            @rush.email = @openrush.email
            @rush.phone = @openrush.phone
            @rush.name = @rush.name + "(" + @openrush.name + ")"
            @rush.residence = @openrush.residence
        end

        @average_pull = get_average_pull(@rush.cpratings)
        @average_chill = get_average_chill(@rush.cpratings)
        @cprating = Cprating.new
        @rush_comments = @rush.rush_comments
        @rush_comment = RushComment.new
        @current_rating = Cprating.where(:user_id=>current_user.id).where(:rush_id=>@rush.id).first
        @friends = @rush.friends
        @events = @rush.events
        @users = @rush.users
        @rank = get_rank(@average_chill, @average_pull)
    end

    def index
        # @rushes = Rush.find_by_sql "select * from rushes as r 
        #                             left join (select rush_id, COALESCE(avg(chill),0.0) as avg_chill from cpratings group by rush_id) as c 
        #                                 on c.rush_id = r.id 
        #                                 order by c.avg_chill DESC"
        @rushes = Rush.find(:all, :order => 'name')
        @RushesController = self
    end

    def edit_friend
        @rush = Rush.find(params[:id])
        @rush.update_attributes(params[:rush])
        redirect_to @rush
    end

    def edit_contact
        @rush = Rush.find(params[:id])
        r = params[:rush]
        arr = r['contacts'].split(",")
        contacts = []
        for c in arr
            contact = Contact.new
            att = {}
            att['user_id'] = c.to_i()
            att['rush_id'] = @rush.id
            contact.update_attributes(att)
            contacts.push(contact)
        end
        r['contacts'] = contacts
        @rush.update_attributes(r)
        redirect_to @rush
    end

    def cut
        @rush = Rush.find(params[:id])
        if @rush.active == 1
            @rush.update_attribute(:active, 0)
            redirect_to '/rushes'
        else
            @rush.update_attribute(:active, 1)
            redirect_to @rush
        end
        
    end



end
