class SessionsController < ApplicationController

	def new
	end
	def create
		user = User.authenticate(params[:username], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to posts_path, :notice => "Logged in!" 
		else
			render :action => :new
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to posts_path
	end
end
