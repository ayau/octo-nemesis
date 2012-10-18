module Api
    module V1
        class RushesController < ApplicationController
            include RushesHelper

            # Get a list of rushes
            def index
                # @rushes = Rush.find_by_sql "select * from rushes as r 
                #                             left join (select rush_id, avg(chill) as avg_chill from cpratings group by rush_id) as c 
                #                                 on c.rush_id = r.id 
                #                                 order by c.avg_chill DESC"
                @rushes = Rush.all
                render :json => @rushes
            end

            def show
                rush = Rush.find(params[:id])
                render :json => rush
            end
            
            # Get a single rush with all info
            def with_info
                rush = Rush.find(params[:id])
                average_pull = get_average_pull(rush.cpratings)
                average_chill = get_average_chill(rush.cpratings)
                rush_comments = rush.rush_comments
                # @current_rating = Cprating.where(:user_id=>current_user.id).where(:rush_id=>@rush.id).first
                friends = rush.friends
                rank = get_rank(average_chill, average_pull)
                
                rush['rank'] = rank
                rush['rush_friends'] = friends.map {|f| f.as_json(:only => :id, :methods => :name)}
                rush['comments'] = rush_comments
                rush['chill'] = average_chill
                rush['pull'] = average_pull
                render :json => rush
            end

            # Search for rushes
            def search 
                @rushes = Rush.where("name like ?", "%#{params[:q]}%")
                render :json => @rushes.map{|f| f.as_json(:only => :id, :methods => :name)}
            end 

        end
    end
end