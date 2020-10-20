class HourlogsController < ApplicationController

before_action :authenticate_user!

  def index
  	@hourlogs = Hourlog.all
  	@title = "Hello"
  end

  def new 
  	@hourlog = Hourlog.new
  end

	def create
	  current_user.hourlogs.create(hourlog_params)
	  redirect_to hourlogs_path
	end

	private

	def hourlog_params
	  params.require(:hourlog).permit(:name, :project, :description, :hours)
	end

end