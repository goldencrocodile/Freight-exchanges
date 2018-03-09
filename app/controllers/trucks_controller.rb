class TrucksController < ApplicationController
  respond_to :html, :json, :js
  before_filter :authenticate_user!, only: [:index]
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
    user = current_user if user_signed_in?
    @truck = user.trucks.build(truck_params)
  	 if @truck.save
      ###  call deliver method for send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Truck was successfully created, please check mail..!' }
      end
    else
      render "trucks/new"
    end
  end
  def send_truck_booked_mail
    if params[:id].present?
     @truck = Truck.find_by_id(params[:id])
     @truck.update_attributes(:truck_booked =>true) if @truck.present?
     TruckBook.truck_booking_email(@truck.user).deliver! if @truck.user.present?
     respond_to do |format|
       format.html { redirect_to :back, success: 'Truck successfully booked, please check mail..!' }
     end
    end
  end
  
  private
    def truck_params
			params.require(:truck).permit(:vehicle_number, :driver_name, :driver_mobile_no, :truck_weight, :truck_type, :schedule_date, :truck_from, :truck_to, :user_id, :truck_booked, :expected_price)
    end
end
