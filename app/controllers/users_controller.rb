class UsersController < ApplicationController
  
  before_action :authenticate_user!


  def index
  	@users = User.all
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
