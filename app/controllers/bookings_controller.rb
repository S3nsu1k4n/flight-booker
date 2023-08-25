class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  def new
    @flight = Flight.find(flight_params['flight_id'])
    @num_passengers = flight_params['passengers']
    @booking = Booking.new
    @num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params['booking']['flight_id'])
    @booking = @flight.bookings.build(booking_params)
    passengers = @booking.passengers.map {|passenger| { name: passenger.name, email: passenger.email } }
    PassengerMailer.with(passengers: passengers).confirmation_email.deliver_later
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flight_params
    params.require(:booking).permit(:flight_id, :passengers)
  end

  def booking_params
    params.require(:booking).permit(passengers_attributes: %i[name email])
  end
end
