class Event < ActiveRecord::Base
  has_many :participants, :through => :attendees
  has_many :attendees
  belongs_to :organiser
  has_many :members, :class_name => "Organiser", :through => :guests
  has_many :guests
  has_many :likes, :through => :members
  has_many :interests, :through => :likes

  def add_member(organiser, event)
    organiser.happenings << event
    organiser.save!
  end

  def remove_member(organiser, event)
    organiser.happenings.delete(event)
    organiser.save!
  end
  
end