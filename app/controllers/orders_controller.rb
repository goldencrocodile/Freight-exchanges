class OrdersController < ApplicationController
  def purchase_status
    begin
    	set_credentials = Razorpay.setup(Figaro.env.MERCHANT_KEY_ID, Figaro.env.MERCHANT_KEY_SECRET)
    	pay_id = Razorpay::Payment.fetch(params[:razorpay_payment_id])
      order = Razorpay::Order.create amount: pay_id.amount, currency: 'INR', receipt: "sandeep.chourey@3scsolution.com"
    	order_data = Order.new(product_id:params[:product_id],price:order.amount,payment_id:params[:razorpay_payment_id], user_id:params[:user_id])
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
  def payment_data
    @load = Load.find_by_id(params[:load_id])
    @user = User.find_by_id(params[:load_id])
  end

  def subscribe user
  end
end

#subscription = Razorpay::Subscription.create plan_id: "plan_9pxNV2jyF7X9td", customer_id: "cust_9q09QqZX3pntVc",
# start_at: (Time.now + (60 * 60 * 24)).to_i, total_count: 3
