class OrdersController < ApplicationController
  def purchase_status
    begin
    	set_credentials = Razorpay.setup(Figaro.env.MERCHANT_KEY_ID, Figaro.env.MERCHANT_KEY_SECRET)
    	order = Razorpay::Order.create amount: 5000, currency: 'INR', receipt: "sandeep.chourey@3scsolution.com"
    	order_data = Order.new(product_id:params[:product_id],price:order.amount,payment_id:params[:razorpay_payment_id], user_id:User.last.id)
     	if order_data.save
        pay_id = Razorpay::Payment.fetch(params[:razorpay_payment_id]) if Rails.env.production?
        pay_id = pay_id.capture({amount:pay_id.amount}) if Rails.env.production?
  	   	respond_to do |format|
  	       format.html { redirect_to root_path, success: 'Payment successfully created.' }
  	     end
  	   end  
    rescue Exception
    	flash[:alert] = "Unable to process payment."
  		redirect_to root_path
    end
  end
end
