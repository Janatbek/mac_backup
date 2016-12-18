class EventsController < ApplicationController
	before_action :require_login,  only: [:index, :create, :destroy]

  def index
  	@state_events = Event.where("state = '#{current_user.state}'")
  end

  def create
  	puts event_params
  	event = Event.new(event_params)
  	event.user = current_user
  	if event.save
			flash[:success] = "Great job"
			render :text => 'saved'
		else
			flash[:errors] = user.errors.full_messages
			# redirect_to :back
			render :text => "Didn't save"
		end
  	
  end

  def join
    join = Attendees.create(user:current_user, event:Event.find(params[:id]))
    redirect_to "/events"
  end


  def event_params
		params.require(:event).permit(:name, :date, :city, :state, :user_id)		
	end

end
