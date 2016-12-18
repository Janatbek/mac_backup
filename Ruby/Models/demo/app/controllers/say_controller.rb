class SayController < ApplicationController
  def index

  end

  def hello
  	render :text => 'Saying Hello'
  end
end
