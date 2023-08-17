class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @flight_dates = Flight.all.map { |f| [f.departure_date.strftime('%Y/%m/%d')] }.uniq.sort
    @flight = Flight.all
  end
end
