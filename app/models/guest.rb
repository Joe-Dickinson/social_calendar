class Guest < ActiveRecord::Base
  # belongs_to :event
  # belongs_to :organiser
  belongs_to :member, :class_name => "Organiser"
  belongs_to :happening, :class_name => "Event"
end
