class StaticPagesController < ApplicationController
before_action :authenticate_user!

	def status
	end

	private 
	def is_approved? 
    	redirect_to status_path unless current_user.is_approved?
  	end 

  	def is_deactivated! 
    	if current_user.deactivated? 
    		redirect_to status_path 
    	end
    end

end
