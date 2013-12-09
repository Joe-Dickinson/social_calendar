class Attendee < ActiveRecord::Base
  belongs_to :participant
  belongs_to :event
end
