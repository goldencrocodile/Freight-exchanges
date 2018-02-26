class TrucksController < ApplicationController
  respond_to :html, :json, :js
  def index
    if params[:selectbox1_selectedvalue].present?
      @trucks = Truck.where(:truck_type=> params[:selectbox1_selectedvalue])
    else
      @trucks = Truck.all
    end
  end
	def new
  	@truck =Truck.new
  end
  def create
    @truck =Truck.new(truck_params)
  	 if @truck.save
      ###  call deliver method for send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Truck was successfully created.' }
      end
    else
      render "trucks/new"
    end
  end
  
   private
    def truck_params
			params.require(:truck).permit(:vehicle_number, :driver_name, :driver_mobile_no, :truck_weight, :truck_type, :schedule_date, :truck_from, :truck_to)
    end
end
