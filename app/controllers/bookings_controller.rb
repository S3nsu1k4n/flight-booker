class BookingsController < ApplicationController
  def new
    @flight = Flight.find(flight_params['flight_id'])
    @num_passengers = flight_params['passengers']
    @passengers = Array.new(@num_passengers.to_i).map { Passenger.new }
  end

  def create
    p '####################create############'
    p params
  end

  private

  def flight_params
    params.require(:booking).permit(:flight_id, :passengers)
  end
end
