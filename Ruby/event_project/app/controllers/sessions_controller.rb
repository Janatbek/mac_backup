class SessionsController < ApplicationController
	def new
		
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to :events_index
		else
			flash[:errors] = ["Invalid email and password conbination"]
			redirect_to :back
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :root
	end
end
