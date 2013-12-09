class Like < ActiveRecord::Base
  belongs_to :interest
  belongs_to :participant
end
