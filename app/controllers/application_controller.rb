class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :authenticate 

    def authenticate
      if(current_user.nil?) 
    	 if(request.env['PATH_INFO'] != loggedout_path && request.env['PATH_INFO'].index('/auth/facebook') != 0 && request.env['PATH_INFO'] != hack_path)
          if(request.env['PATH_INFO'] == root_path)
             redirect_to(loggedout_path)
          else
        	   redirect_to('/401.html')
          end
        end
      end
    end

  helper_method :current_user

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
