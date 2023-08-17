class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @flight_dates = Flight.all.map { |f| [f.departure_date.strftime('%Y/%m/%d')] }.uniq.sort
    @flight = Flight.all
    @available_flights = Flight.where(flight_params) if params.key? :flight
  end

  private

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :departure_date)
  end

end
