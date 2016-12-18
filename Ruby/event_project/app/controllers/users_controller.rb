class UsersController < ApplicationController

	before_action :require_login, except: [:new, :create]
  	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def new
		render :new
	end

	def create
		user = User.new(user_params)
		if user.save
			flash[:success] = "Great job"
			session[:user_id] = user.id
			redirect_to :events_index
		else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
			
	end

	def edit
		fail
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)		
	end
end