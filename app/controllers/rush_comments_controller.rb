class RushCommentsController < ApplicationController
  def new
  end

  def create
  	@rush_comment = RushComment.new(params[:rush_comment])
    @rush_comment.save
    redirect_to Rush.find(@rush_comment.rush_id)
  end

  def destroy
    @rush_comment = RushComment.find(params[:id])
    @rush_comment.destroy
    redirect_to Rush.find(@rush_comment.rush_id)
  end

  def edit
    @rush_comment = RushComment.find(params[:id])
    @rush_comment.update_attributes(params[:rush_comment])
    redirect_to Rush.find(@rush_comment.rush_id)  
  end

end
