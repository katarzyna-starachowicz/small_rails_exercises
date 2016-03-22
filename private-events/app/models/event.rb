class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :attendee

  scope :previous, -> { where("date < ?", Time.zone.now) }
  scope :upcoming, -> { where("date >= ?", Time.zone.now) }
end
