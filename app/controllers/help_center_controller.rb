class HelpCenterController < ApplicationController
  def our_network
  	@networks = Truck.pluck(:truck_from).flatten.compact.uniq
    @lat_lng = []
    @networks = @networks.present? ? @networks : ["Pune","Mumbai"]
  	@networks.each do |t|
  		source_lat_long = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{t}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      @lat_lng << source_lat_long["results"][0]["geometry"]["location"]
  	end
  end
end