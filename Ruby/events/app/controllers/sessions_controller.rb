class SessionsController < ApplicationController
	def new
		if !flash[:errors]
			flash[:errors] = []
		end
	end

	def login
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = ["Invalid Combination"]
			redirect_to '/'
		end
	end

	def logout
		reset_session
		redirect_to '/'
	end
end
