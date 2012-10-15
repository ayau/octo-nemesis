class RushCommentsController < ApplicationController
  def new
  end

  def create
  	@rush_comment = RushComment.new(params[:rush_comment])
        if @rush_comment.save
            redirect_to @rush_comment
        else
            render 'new'
        end
  end
end
