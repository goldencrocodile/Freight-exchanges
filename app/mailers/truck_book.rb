class TruckBook < ActionMailer::Base
  default from: "sandeep.chourey@3scsolution.com"
  def truck_booking_email(login_user,load)
    @user = login_user
    @load = load
    mail(to: login_user.user.email.present? ? login_user.user.email : '', subject: "Truck Booking mail")
  end
end