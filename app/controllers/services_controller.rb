class ServicesController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
     if @contact.save
      ###  call deliver method for send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Contact successfully created.' }
     end
    else
      render "services/new"
    end
  end
	def warehouse_inquiry
	end
  def franchise_inquiry
  end
  def vehicle_loan_inquiry
  end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :messsage, :mobile_number)
    end
end
