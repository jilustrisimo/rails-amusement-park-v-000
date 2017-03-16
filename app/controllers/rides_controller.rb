class RidesController < ApplicationController
  def new
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id] )
    # flash[:message] = @ride.take_ride
    # redirect_to user_path(@ride.user)
    if @ride.take_ride == true
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to user_path(@ride.user)
    else
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    end
  end
end
