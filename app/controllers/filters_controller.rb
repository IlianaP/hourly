class FiltersController < ApplicationController

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
		@user = User.all
		@filter = Filter.first
		@project = Project.all
	    if ((@filter.date_to != nil) && (@filter.date_from != nil))
			if (@filter.project != nil)
				@hourlogs = Hourlog.where(project_id: @filter.project, date: @filter.date_from..@filter.date_to).order(date: :desc).paginate(:page => params[:page], :per_page => 7)
			elsif (@filter.project == nil)
				@hourlogs = Hourlog.where(date: @filter.date_from..@filter.date_to).order(date: :desc).paginate(:page => params[:page], :per_page => 7)
			end
		elsif (@filter.project != nil)
			@hourlogs = Hourlog.where(project_id: @filter.project).order(date: :desc).paginate(:page => params[:page], :per_page => 7)
		else 
			@hourlogs = Hourlog.all.order(date: :desc).paginate(:page => params[:page], :per_page => 7)
		end
	end

	def update
		@filter = Filter.first
		@filter.update_attributes(filter_params)
		redirect_to edit_filter_path(id: 1)
	end

	private
	def filter_params
	  params.require(:filter).permit(:email, :project, :date_to, :date_from)
	end
end
