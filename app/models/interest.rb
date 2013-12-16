class Interest < ActiveRecord::Base
  has_many :organisers, :through => :likes
  has_many :likes

  def interest_exists
    @interests = Interest.all 
    @interests.each do |i|
      if i.tag == self.tag
        @existing_interest = i 
      break
      end
    end
    @existing_interest
  end

  def organiser_has_interest(organiser)
    @has_interest = false
    organiser.interests.each do |i|
      if i.tag == self.tag
        @has_interest = true
        break
      end
    end
    @has_interest
  end
end
