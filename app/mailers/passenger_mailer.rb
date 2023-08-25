class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email
    @passenger = params[:passenger]
    @url = 'http://example.com/login'
    mail(to: @passenger.email, subject: 'Welcome to my awesome site')
  end
end
