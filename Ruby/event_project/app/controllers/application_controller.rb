class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user
  end

  def require_login
    redirect_to :root if session[:user_id] == nil
  end
  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
   def find_user id
    user = User.find(id)
    user
  end
  def event_join id
    joined = Attendee.where("user_id = #{session[:user_id]}").where("event_id = #{id}").any?
    joined
  end
 helper_method :current_user, :find_user, :event_join
end
