class LoadsController < ApplicationController
  respond_to :html, :json, :js
  def index
    @loads = Load.all
  end
	def new
  	@load =Load.new
  end
  def create
    @load =Load.new(load_params)
  	 if @load.save
      ###  call deliver method for send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Load was successfully created.' }
     end
      else
        render "loads/new"
      end
  end

  def distance_calculation
    if  params[:distance_from].present? and params[:distance_to].present?
      # @response = HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:distance_from]}&destinations=#{params[:distance_to]}+BC&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      # @source_lat_long = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:distance_from]}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      # @destination_lat_long = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:distance_to]}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      # @source_lat_long = @source_lat_long["results"][0]["geometry"]["location"]
      # @destination_lat_long = @destination_lat_long["results"][0]["geometry"]["location"]
      @response = HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:distance_from]}&destinations=#{params[:distance_to]}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      respond_to do |format|  ## Add this
        format.js
        format.html
      end  
    end
  end
  def calculations
  end
   private
    def load_params
      params.require(:load).permit(:load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date)
    end
end