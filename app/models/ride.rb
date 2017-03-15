class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user, attraction = User.find(user_id), Attraction.find(attraction_id)
    message = 'Sorry. '
    message += "You do not have enough tickets the #{attraction.name}. " if user.tickets < attraction.tickets
    message += "You are not tall enough to ride the #{attraction.name}." if user.height < attraction.min_height
    if message == 'Sorry. '
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    else
      message.strip
    end
  end
end
