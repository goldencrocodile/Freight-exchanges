class Ordermailer < ActionMailer::Base
  default from: "sandeep.chourey@3scsolution.com"
  def booking_email(truck,load)
    @truck = truck
    @load = load
    mail(to: @load.user.email, subject: "Load Booking mail")
  end
end