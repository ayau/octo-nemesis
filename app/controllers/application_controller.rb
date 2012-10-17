class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :authenticate 

    def authenticate
    	if(request.env['PATH_INFO'] != root_path && request.env['PATH_INFO'].index('/auth/facebook') != 0)
        	redirect_to(root_path) unless !current_user.nil?
        end
    end

  helper_method :current_user

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
