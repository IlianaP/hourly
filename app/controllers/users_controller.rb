class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def current_user_home
  	redirect_to current_user
  end

  def index
  	@users = User.all
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

  private 
  def user_params
    params.require(:user).permit(:fname, :lname, :role, :email, :is_admin, :is_approved)
  end

end
