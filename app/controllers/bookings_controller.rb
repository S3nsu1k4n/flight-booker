class BookingsController < ApplicationController
  def new
    p '##########'
    @flight = Flight.find(flight_params['flight_id'])
    @num_passengers = flight_params['passengers']

  end

  private

  def flight_params
    params.require(:booking).permit(:flight_id, :passengers)
  end
end
