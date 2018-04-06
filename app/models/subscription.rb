class Subscription < ActiveRecord::Base
	belongs_to :user
	belongs_to :plan
	PLAN = { Monthly: 1000, Half_yearly: 5000 }
end