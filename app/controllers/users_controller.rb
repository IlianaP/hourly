class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :is_approved?
  before_action :is_admin?, only: [:index]
  before_action :is_deactivated!
  

  def current_user_home
  	redirect_to current_user
  end

  def index
  	@users = User.all.order(deactivated: :asc)
  end

  def show 
  	@user = User.find(params[:id])
  	@hourlogs = Hourlog.where(user_id: @user.id).order(date: :desc).paginate(:page => params[:page], :per_page => 10)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update_attributes(user_params)
  	if @user.valid? 
            redirect_to users_index_path
        else 
            render :new, status: :unprocessable_entity
        end
  end

  def destroy
    	@user = User.find(params[:id])
    	if @user.deactivated
    		@user.update_attributes(deactivated: false)
    	else 
    		@user.update_attributes(deactivated: true)
    	end
    	redirect_to users_index_path
   	end

  private 
  def user_params
    params.require(:user).permit(:fname, :lname, :role, :email, :is_admin, :is_approved)
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
