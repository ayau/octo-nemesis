class RushesController < ApplicationController
    def new
        @rush = Rush.new
    end
    def create
        @rush = Rush.new(params[:rush])
        @rush.phone = @rush.phone.gsub(/[^0-9]/i, '')
            if @rush.save
                redirect_to @rush
            elsif Rush.find_by_phone(@rush.phone)
                redirect_to Rush.find_by_phone(@rush.phone)
            else
                render 'new'
            end
    end
    def show
        @rush = Rush.find(params[:id])
        @average_pull = get_average_pull(@rush.cpratings)
        @average_chill = get_average_chill(@rush.cpratings)
        @cprating = Cprating.new
        @rush_comments = @rush.rush_comments
        @rush_comment = RushComment.new
        @current_rating = Cprating.where(:user_id=>current_user.id).where(:rush_id=>@rush.id).first
        # @current_rating = Cprating.find(5)
        # @current_rating = Cprating.find_by_rush_id_and_user_id(@rush.id, current_user.id)
    end
    def index
        @rushes = Rush.find_by_sql "select * from rushes as r 
                                    left join (select rush_id, avg(chill) as avg_chill from cpratings group by rush_id) as c 
                                        on c.rush_id = r.id 
                                        order by c.avg_chill DESC"
    end

    def get_average_pull(cpratings)
        total = 0
        for cp in cpratings
            if !cp.pull.nil?
                total += cp.pull
            end
        end
        if cpratings.length != 0
            return total/cpratings.length
        else 
            return 0
        end
    end

    def get_average_chill(cpratings)
        total = 0
        for cp in cpratings
            if !cp.pull.nil?
                total += cp.chill
            end
        end
        if cpratings.length != 0
            return total/cpratings.length
        else
            return 0
        end
    end

end
