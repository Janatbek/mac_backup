class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :event_joins, through: :attendee, source: :event

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :city, :state,  presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, length: {in: 8..20}

   before_save do
    self.email.downcase!
  end
end
