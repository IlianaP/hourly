class HourlogsController < ApplicationController
  def index
  	@hourlogs = Hourlog.all
  	@title = "Hello"
  end

  def new 
  	@hourlog = Hourlog.new
  end

	def create
	  Hourlog.create(hourlog_params)
	  redirect_to root_path
	end

	private

	def hourlog_params
	  params.require(:hourlog).permit(:name, :project, :description, :hours)
	end

end