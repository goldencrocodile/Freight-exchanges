class Contact < ActiveRecord::Base
	validates :name,:presence => true
	validates :email, :presence => true
	validates :subject, :presence => true
	validates :messsage,:presence => true
	CONTACT_CATEGORY = ['Advertise on the website',
      'Complaint',
      'Customer Service',
      'Electronic Toll Collection',
      'Feedback',
      'Fleet Management Inquiry',
      'Franchise',
      'General Information',
      'GPS Tracking',
      'Not Sure',
      'Partnership',
      'Sales Query',
      'Spam Report',
      'Transport Contract',
      'Vehicle loan inquiry',
      'Warehouse']
	after_create :send_email_to_user

	def send_email_to_user
		Contactus.contact_mail(self).deliver
	end
end