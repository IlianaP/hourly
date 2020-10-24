class FiltersController < ApplicationController

before_action :authenticate_user!

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
		@filter = Filter.first
		@project = Project.all
		@hourlogs = Hourlog.all.order(date: :desc)
	end

	def update
		@filter = Filter.first
		@filter.update_attributes(filter_params)
		redirect_to edit_filter_path(id: 1)
	end

	private
	def filter_params
	  params.require(:filter).permit(:project, :date_to, :date_from)
	end
end
