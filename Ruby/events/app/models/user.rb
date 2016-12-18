class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :event_joins, through: :event_users, source: :event
  has_many :comments

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence:true, uniqueness:{case_sensitive:false}, format:{with:EMAIL_REGEX}
  validates :first_name, :last_name, :city, presence:true
  validates :state, presence:true, length:{is:2}
end
