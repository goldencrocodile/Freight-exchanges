class Ordermailer < ActionMailer::Base
  default from: "sandeep.chourey@3scsolution.com"
  def booking_email(user)
    @user = user
    mail(to: @user.email, subject: "Load Booking mail")
  end
end