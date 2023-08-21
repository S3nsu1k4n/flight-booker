class BookingsController < ApplicationController
  def new
    @flight = Flight.find(flight_params['flight_id'])
    @num_passengers = flight_params['passengers']
    @booking = Booking.new
    @num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
  end

  private

  def flight_params
    params.require(:booking).permit(:flight_id, :passengers)
  end
end
