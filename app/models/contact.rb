class Contact < ActiveRecord::Base
	validates :name,:presence => true
	validates :email, :presence => true
	validates :subject, :presence => true
	validates :messsage,:presence => true

	after_create :send_email_to_user

	def send_email_to_user
		Contactus.contact_mail(self).deliver
	end
end