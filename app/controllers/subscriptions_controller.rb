class SubscriptionsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@user = current_user if user_signed_in?
	end
	def subscribe_user
		if user_signed_in?
			begin
				cust_id = current_user.customer_id if current_user.customer_id.present?
	    	set_credentials = Razorpay.setup(Figaro.env.MERCHANT_KEY_ID, Figaro.env.MERCHANT_KEY_SECRET)
	    	plan = Razorpay::Plan.fetch params[:plan_id] if params[:plan_id].present?	
	    	plan_amount = plan.item["amount"]/100 if plan.present?
	    	razor_subscription = Razorpay::Subscription.create plan_id: "plan_9vS9eTSf8lPqRn", customer_id: current_user.customer_id, start_at: (Time.now + (60 * 60 * 24)).to_i, total_count: 3
				if plan.item["name"] == "Half yearly"
					subscription = Subscription.create(:plan_id => params[:plan_id],:user_id => cust_id,:start_at => Time.now , :next_due_date=> Time.now + 90.days,:status=> "Created", :payment_id => params[:razorpay_payment_id])
				else
					subscription = Subscription.create(:plan_id => params[:plan_id],:user_id => cust_id,:start_at => Time.now , :next_due_date=> Time.now + 30.days,:status=> "Created", :payment_id => params[:razorpay_payment_id])
	    	end
	    	current_user.update_attribute(:subscription_date, Time.now) if current_user.present?
	    rescue Exception
	    	flash[:alert] = "Unable to process payment."
	  		redirect_to root_path
	    end
		end
	end
	# private
 #    def subscribe_params
	# 		params.require(:subscribe).permit(:plan_id, :user_id,:start_at,:next_due_date,:status)
 #    end
end
# cust_id = current_user.customer_id if current_user.customer_id.present?
# subscription = Razorpay::Subscription.create plan_id: "plan_9vS9eTSf8lPqRn", customer_id: current_user.customer_id, start_at: (Time.now + (60 * 60 * 24)).to_i, total_count: 3
