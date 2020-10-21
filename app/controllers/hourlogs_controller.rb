class HourlogsController < ApplicationController

before_action :authenticate_user!

  def index
  	@hourlogs = Hourlog.all
  	@title = "Hello"
  	@project = Project.all
  end

  def new 
  	@hourlog = Hourlog.new
  	@projects = Project.all
  end

	def create
	  current_user.hourlogs.create(hourlog_params)
	  redirect_to hourlogs_path
	end

  def show
  	@hourlog = Hourlog.find(params[:id])
  end

  def edit 
  	@hourlog = Hourlog.find(params[:id])
  	@projects = Project.all
  end

  def update
  	@hourlog = Hourlog.find(params[:id])
  	@hourlog.update_attributes(hourlog_params)
  	redirect_to hourlogs_path
  	@projects = Project.all
  end

  def destroy
  	@hourlog = Hourlog.find(params[:id])
  	@hourlog.destroy
  	redirect_to hourlogs_path
  end

	private

	def hourlog_params
	  params.require(:hourlog).permit(:name, :project_id, :description, :hours, :date)
	end

end