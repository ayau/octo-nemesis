module Api
    module V1
        class RushesController < ApplicationController

            def index
                # @rushes = Rush.find_by_sql "select * from rushes as r 
                #                             left join (select rush_id, avg(chill) as avg_chill from cpratings group by rush_id) as c 
                #                                 on c.rush_id = r.id 
                #                                 order by c.avg_chill DESC"
                @rushes = Rush.all
                render :json => @rushes
            end

            def search 
                @rushes = Rush.where("name like ?", "%#{params[:q]}%")  
                render :json => @rushes
            end 
        end
    end
end