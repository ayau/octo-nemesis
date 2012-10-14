class UsersController < ApplicationController
  def new
  end
  def show
  	@rush = Rush.find(params[:id])
  end
end
