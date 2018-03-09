class TrucksController < ApplicationController
  respond_to :html, :json, :js
  before_filter :authenticate_user!, only: [:index]
  def index
    if current_user.present? and current_user.role.name=="Load Provider"
      if (params[:truck_from].present? or params[:truck_to].present? or params[:vehicle_number].present?)
        @trucks = Truck.search(params)
      else
        @trucks = Truck.paginate(:page => params[:page], :per_page => 10)
      end
    else
      respond_to do |format|
       format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
      end
    end
  end
	def new
    if current_user.present? and current_user.role.name=="Truck Owner"
      @truck =Truck.new
    else
      respond_to do |format|
        format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
      end
    end
  end
  def create
    if current_user.present? and current_user.role.name=="Truck Owner"
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
    else
      respond_to do |format|
        format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
      end
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
