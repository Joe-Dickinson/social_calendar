class Event < ActiveRecord::Base
  has_many :participants, :through => :attendees
  belongs_to :organiser
  has_many :attendees
  has_many :members, :class_name => "Organiser", :through => :guests
  has_many :guests
end
