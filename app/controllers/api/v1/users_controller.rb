module Api
    module V1
        class UsersController < ApplicationController
            # Search for users
            def search 
                @users = User.where("name like ?", "%#{params[:q]}%")
                render :json => @users.map{|f| f.as_json(:only => :id, :methods => :name)}
            end 

        end
    end
end