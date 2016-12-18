class Event < ActiveRecord::Base
      has_many :attendee
      has_many :user, :through => :attendee
end
