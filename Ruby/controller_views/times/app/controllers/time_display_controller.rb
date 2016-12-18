class TimeDisplayController < ApplicationController
  def main
  	@time = Time.now
  end
end
