class SurveysController < ApplicationController
  def index
  	if !session[:views]
  		session[:views] = 0
    end
  end

  def process_survey
  	session[:views] = session[:views] + 1

  	session[:result] = params[:survey]

    flash[:success] = "You have submitted this form #{session[:views]} time(s)"

    redirect_to('/surveys/result')
  end

  def result
    @result = session[:result]
  	@message = flash[:success]
  end
end
