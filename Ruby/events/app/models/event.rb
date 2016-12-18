class Event < ActiveRecord::Base
  belongs_to :user
  has_many :user_joins, through: :event_users, source: :users
  has_many :comments

  validates :name, :city, :date, presence:true
  validates :state, presence:true, length:{is:2}
  validate :date_valid

  def date_valid
  	datetime = self.date.to_datetime
  	today = Time.current
  	if ((datetime.to_i - today.to_i) < 0)
  		errors.add(:date, "Invalid")
  	end
  end
end
