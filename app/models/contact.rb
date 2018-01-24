class Contact < ActiveRecord::Base
	validates :name,:presence => true
	validates :email, :presence => true
	validates :subject, :presence => true
	validates :messsage,:presence => true
	def self.send_mail(contact)
		 contact_mail(contact).deliver!
	end
end
