class ProjectsController < ApplicationController

	before_action :authenticate_user!
    before_action :is_admin?
    before_action :is_approved?
    before_action :is_deactivated!

	def index 
		@projects = Project.all.order(status: :desc, name: :asc).paginate(:page => params[:page], :per_page => 25)
		@hourlogs = Hourlog.all
		
	end

	def new 
		@project = Project.new
	end

	def create
		@project = Project.create(project_params)
		if @project.valid? 
			redirect_to projects_path
		else 
			render :new, status: :unprocessable_entity
		end
    end

    def show
    	@project = Project.find(params[:id])
        @hourlogs = Hourlog.where(project_id: @project.id).order(date: :desc).paginate(:page => params[:page], :per_page => 10)

    end

    def edit 
    	@project = Project.find(params[:id])
    end

    def update 
    	@project = Project.find(params[:id])
    	@project.update_attributes(project_params)
        if @project.valid? 
            redirect_to projects_path
        else 
            render :new, status: :unprocessable_entity
        end
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

    def is_admin? 
        redirect_to current_user && flash.alert = "You need to be an admin to access this functionality." unless current_user.is_admin?
    end 

    def is_approved? 
        redirect_to status_path && flash.alert = "Your account is not approved yet." unless current_user.is_approved?
    end 

    def is_deactivated! 
        if current_user.deactivated? 
            redirect_to status_path
        end
    end 

end
