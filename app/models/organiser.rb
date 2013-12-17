class Organiser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events
  has_many :happenings, :class_name => "Event", :through => :guests
  has_many :guests
  has_many :interests, :through => :likes
  has_many :likes
  has_many :recommendations
  has_many :organisers do 
    def likeminded(e)
      e.members.where("likes.interest_id in (?)", proxy_association.owner.interest_ids).joins(:likes => :interest).uniq
    end
  end

  def apostrophe_position
    if self.name[-1,1] != "s"
      "#{self.name}'s"
    else
      "#{self.name}'"
    end
  end

  def add_to_event(organiser, event)
    event.members << organiser 
    event.save!
    event.add_member(organiser, event)
  end

  def remove_from_event(organiser, event)
    event.members.delete(organiser)
    event.save!
    event.remove_member(organiser, event)
  end


  def recommend_events(organiser)
    @interests = []
    @organisers = []
    @events = []
    @self_happenings = [] 

    self.happenings.each do |h|
      @self_happenings << h.id
    end

    self.interests.each do |i|
      if i.organisers.count >= 2 
        @interests << Interest.find_by_id(i) 
      end
    end

    @interests.each do |i| 
      i.organisers.each do |o| 
        if o != self 
          @organisers << Organiser.find_by_id(o.id) 
        end
      end
    end

    @organisers.each do |i| 
      i.happenings.each do |h| 
        @events << Event.find_by_id(h.id) 
      end
    end

    @duplicate = false
    @events.each do |e|
      self.happenings.each do |h|
        if h == e 
          @duplicate = true
          break
        end
      end
    end

    unless @duplicate == true
      @events.each do |e|   
        @recommendation = Recommendation.new
        @recommendation.event_id = e.id
        @recommendation.rank = 1
        self.recommendations << @recommendation
      end
    end
    self.recommendations
    @events
  end

  def get_recommendations
    recommended_events = []
    interests.each do |i|
      i.organisers.each do |o|
        unless o == self
          o.happenings.each do |h|
            recommended_events << h
          end
        end
      end
    end
    # get_recommendation_rank(recommended_events)
    recommended_events
  end

  def get_recommendation_rank(events_array)
    events_array.each do |e|
      @found = false
      self.recommendations.each do |r|
        if r.event == e
          binding.pry
           @rec = self.recommendations.find_by_event_id(e.id)
           @rec.update_attributes({:rank => 2})
          # @recommendation = Recommendation.find_by_event_id(e.id)
          # @recommendation.rank += 1
          binding.pry
          # self.recommendations << @recommendation
          # @recommendation.save!
          @found = true
          break
        end
      end
      while @found == false do
        @recommendation = Recommendation.new
        @recommendation.rank = 1
        @recommendation.event_id = e.id
        @recommendation.organiser_id = self.id
        self.recommendations << @recommendation
        break
      end
    end    
  end

  # has_many :popular_interests, -> {select("interests.*").joins(:likes).group(:interest_id).having("count(interest_id) > 1")}, :class_name => "Interest",
  # :through => :likes, :source => :interest
  

  def fill_events(organiser)
    events_output = []
    organiser.recommendations.each do |r|
      events_output << Event.find_by_id(r.event_id)
    end
    events_output
  end

end