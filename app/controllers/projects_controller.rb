class ProjectsController < ApplicationController

	before_action :authenticate_user!

	def index 
		@projects = Project.all.order(status: :desc)
		@hourlogs = Hourlog.all
		
	end

	def new 
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		if @project.valid? 
			redirect_to root_path
		else 
			render :new, status: :unprocessable_entity
		end
    end

    def show
    	@project = Project.find(params[:id])
    	@hourlogs = Hourlog.all.order(date: :desc).paginate(:page => params[:page], :per_page => 10)

    end

    def edit 
    	@project = Project.find(params[:id])
    end

    def update 
    	@project = Project.find(params[:id])
    	@project.update_attributes(project_params)
    	redirect_to projects_path
    end

    def destroy
    	@project = Project.find(params[:id])
    	@project.destroy
    	redirect_to projects_path
   	end

    private
    def project_params
    params.require(:project).permit(:name, :description, :plan, :planhours, :thours, :plandate, :duration, :starthourtrack, :status)
    end

end
