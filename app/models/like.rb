class Like < ActiveRecord::Base
  belongs_to :organiser
  belongs_to :interest
end
