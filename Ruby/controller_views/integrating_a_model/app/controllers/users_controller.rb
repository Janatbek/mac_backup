class UsersController < ApplicationController
  def index
    render json: User.all
  end
  
  def update
    render :text => 'in update method'
    User.find(params[:id]).update(name)
  end


  def create
   @user = User.create( name: params[:name])
  redirect_to '/users'
  end

  def edit

    @person= User.find(params[:id]) 
  end

  def total
    @total = User.count 
  end

  def show
    render json: User.find(params[:id])
  end
end
