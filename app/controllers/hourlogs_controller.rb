class HourlogsController < ApplicationController

before_action :authenticate_user!
before_action :is_approved?
before_action :is_admin?, only: [:index]
before_action :is_deactivated!

  def index

    @user = User.all
    @filter = Filter.first
    @project = Project.all
    if ((@filter.date_to != nil) && (@filter.date_from != nil))
      if (@filter.project != nil) && (@filter.user_id != nil)
        @hourlogs = Hourlog.where(project_id: @filter.project, user_id: @filter.user_id, date: @filter.date_from..@filter.date_to).order(date: :desc)
      
      elsif (@filter.project == nil) && (@filter.user_id != nil)
        @hourlogs = Hourlog.where(user_id: @filter.user_id, date: @filter.date_from..@filter.date_to).order(date: :desc)
      
      elsif (@filter.project != nil) && (@filter.user_id == nil)
        @hourlogs = Hourlog.where(project_id: @filter.project, date: @filter.date_from..@filter.date_to).order(date: :desc)

      elsif (@filter.project == nil) && (@filter.user_id == nil)
        @hourlogs = Hourlog.where(date: @filter.date_from..@filter.date_to).order(date: :desc)
      end

    elsif (@filter.project != nil) && (@filter.user_id != nil)
      @hourlogs = Hourlog.where(project_id: @filter.project, user_id: @filter.user_id).order(date: :desc)
    
    elsif (@filter.project == nil) && (@filter.user_id != nil)
      @hourlogs = Hourlog.where(user_id: @filter.user_id).order(date: :desc)

    elsif (@filter.project != nil) && (@filter.user_id == nil)
      @hourlogs = Hourlog.where(project_id: @filter.project).order(date: :desc)
    else 
      @hourlogs = Hourlog.all.order(date: :desc)
    end

    respond_to do |format|
      format.html
      format.csv { render text: @hourlogs.to_csv }
    end

    @hourlogs_paginated = @hourlogs.paginate(:page => params[:page], :per_page => 7)
    @total_hourlogs = @hourlogs.sum(:hours)

  end 

  def new 
  	@hourlog = Hourlog.new
  	@projects = Project.all
  end

	def create
    @projects = Project.all
    @user = User.find(current_user)
	  @hourlog = current_user.hourlogs.create(hourlog_params)
    if @hourlog.valid? 
      redirect_to current_user
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
  	redirect_to current_user
  	@projects = Project.all
  end

  def destroy
    @user = User.find(current_user)
  	@hourlog = Hourlog.find(params[:id])
    if @user.is_admin
       @hourlog.destroy
  	   redirect_to edit_filter_path(id: 1)
    elsif
       current_user.id == @hourlog.user_id
       @hourlog.destroy
       redirect_to current_user
    else 
      flash.alert = "You don't have permissions to delete this record."
      redirect_to edit_filter_path(id: 1)
    end
  end

	private

	def hourlog_params
	  params.require(:hourlog).permit(:name, :project_id, :description, :hours, :date)
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