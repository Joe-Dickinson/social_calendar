class Event < ActiveRecord::Base
  has_many :participants, :through => :attendees
  belongs_to :organiser
  has_many :attendees
end
