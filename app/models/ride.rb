class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user_can_ride?
      # the happiness of the user is changed
      # binding.pry
      self.user.happiness = (self.user.happiness) + (self.attraction.happiness_rating)
      # the nausea of the self.user is changed
      self.user.nausea = (self.user.nausea) + (self.attraction.nausea_rating)
      # the amount of tickets the self.user has is changed
      self.user.tickets = (self.user.tickets) - (self.attraction.tickets)
      self.user.save
    else
       user_no_ride_ticket
     end
  end

  def user_can_ride?
    (self.user.tickets > self.attraction.tickets) && (self.user.height > self.attraction.min_height)
  end

  def user_no_ride_ticket
      if (self.attraction.tickets > self.user.tickets) && (self.user.height < self.attraction.min_height)
          "Sorry. You do not have enough tickets the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif self.attraction.tickets > self.user.tickets
        "Sorry. You do not have enough tickets the #{self.attraction.name}."
      else
        self.attraction.min_height > self.user.height
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end
   end

end
