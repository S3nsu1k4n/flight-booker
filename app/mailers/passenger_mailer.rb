class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def confirmation_email
    @passengers = params[:passengers]
    @url = 'http://example.com/login'
    @passengers.each do |passenger|
      @passenger = passenger
      mail(to: email_address_with_name(@passenger[:email], @passenger[:name]), subject: 'Booking confirmation')
    end
  end
end
