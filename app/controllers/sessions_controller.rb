class SessionsController < ApplicationController
    def new
    end
    def create
        auth = request.env["omniauth.auth"]
        user = User.find_by_uid_and_token(auth["uid"],auth["credentials"]["token"]) || User.create_with_omniauth(auth)
        session[:user_id] = user.id
        if user
            sign_in user
            redirect_to root_url
        else
            redirect_to 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        sign_out
        redirect_to root_url
    end
end
