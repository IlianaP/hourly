class FiltersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_approved?
	before_action :is_admin?
	before_action :is_deactivated!
	
	def index
	end 

	def new
		@filter = Filter.new
	end 

	def create 
		Filter.create(filter_params)
		redirect_to hourlogs_path
	end 

	def show
	end

	def edit
	end

	def update
		@filter = Filter.first
		@filter.update_attributes(filter_params)
		redirect_to hourlogs_path
	end

	private
	def filter_params
	  params.require(:filter).permit(:user_id, :project, :date_to, :date_from)
	end

    def is_admin? 
        redirect_to current_user && flash.alert = "You need to be an admin to access this functionality." unless current_user.is_admin?
    end 

  	def is_approved? 
    	redirect_to status_path unless current_user.is_approved?
  	end 
  	def is_deactivated! 
    if current_user.deactivated? 
    	redirect_to status_path 
    end
    end 
end
