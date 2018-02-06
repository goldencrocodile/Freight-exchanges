class Contactus < ActionMailer::Base
  default from: "schourey1988@gmail.com"
  def contact_mail(user)
  	@user = user
  	mail(to: "schourey1988@gmail.com", subject: 'Contact Us')
  end
end