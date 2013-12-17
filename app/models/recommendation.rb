class Recommendation < ActiveRecord::Base
  belongs_to :organiser
  belongs_to :event
end
