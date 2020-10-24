class HourlogsController < ApplicationController

before_action :authenticate_user!


  def index
  	@hourlogs = Hourlog.all.order(date: :desc).paginate(:page => params[:page], :per_page => 7)
  	@title = "Hello"
  	@project = Project.all
    @filter = Filter.first

    respond_to do |format|
       format.html
       format.pdf do
          render :pdf => “file.pdf”, :template => ‘hourlogs/index.html.erb’
       end
    end

  end 

  def new 
  	@hourlog = Hourlog.new
  	@projects = Project.all
  end

	def create
    @projects = Project.all

	  @hourlog = current_user.hourlogs.create(hourlog_params)
    if @hourlog.valid? 
      redirect_to hourlogs_path
    else 
      render :new, status: :unprocessable_entity
    end 
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