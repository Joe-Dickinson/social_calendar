class Interest < ActiveRecord::Base
  has_many :participants, :through => :likes
  has_many :likes
end
