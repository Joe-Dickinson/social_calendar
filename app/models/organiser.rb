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
      e.members.where("likes.interest_id in (?) AND likes.organiser_id != ?", 
        proxy_association.owner.interest_ids, proxy_association.owner.id).joins(:likes)
    end
  end

  def get_similar
    @similar = []
    self.happenings.each do |h|
      @similar += self.organisers.likeminded(h)
    end
    @similar.uniq
  end

  def recommended_events
    Event.where("likes.interest_id in (?)", self.interest_ids).joins(:likes => :interest).uniq
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

end