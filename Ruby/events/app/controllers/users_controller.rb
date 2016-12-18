class UsersController < ApplicationController

	def register
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to "/events"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/"
		end
	end

	def edit
		@user = current_user
	end
	def update
		user = current_user
		user.update(user_params)
		if user.errors.any?
			flash[:errors] = user.errors.full_messages
			redirect_to '/users/edit'
		else
			redirect_to '/events'
		end
	end

	private
  	def user_params
   		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  	end
end
