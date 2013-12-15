class Interest < ActiveRecord::Base
  has_many :organisers, :through => :likes
  has_many :likes
end
