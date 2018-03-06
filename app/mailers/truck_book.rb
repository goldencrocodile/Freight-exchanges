class TruckBook < ActionMailer::Base
  default from: "sandeep.chourey@3scsolution.com"
  def truck_booking_email(user)
    @user = user
    mail(to: @user.email, subject: "Truck Booking mail")
  end
end
