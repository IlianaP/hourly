class ProjectsController < ApplicationController

	before_action :authenticate_user!

	def index 
		@projects = Project.all
		@hourlogs = Hourlog.all
		
	end

	def new 
		@project = Project.new
	end

	def create
		Project.create(project_params)
		redirect_to root_path
    end

    private
    def project_params
    params.require(:project).permit(:name, :description, :plan, :planhours, :thours)
    end

end
