class SayController < ApplicationController
  def main
    render :text =>  'What do you want me to say???'
  end
  def index
      render :text => 'Hello CodingDojo'
  end
  def hello
    render :text => 'Saying Hello!'
  end
  def joe
    render :text => 'Saying Hello Joe!'
  end

  def times
    @count = session[:counter]
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1
      render :text => "You visited this url #{@count} time"
  end

  def restart
    session[:id] = nil
    render :text =>  'Destroyed the session!'
  end
  # def index
  # 	render :text => 'What do you want me to say???'
  # end

end
