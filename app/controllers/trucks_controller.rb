class TrucksController < ApplicationController
  require 'will_paginate/array'
  respond_to :html, :json, :js
  before_filter :authenticate_user!, only: [:index]
  def index
    if current_user.present? and current_user.role.name=="Load Provider"
      if (params[:truck_from].present? or params[:truck_to].present? or params[:vehicle_number].present? or params[:schedule_date].present?)
        @trucks = params[:schedule_date].present? ? Truck.where("schedule_date = ?",params[:schedule_date]).search(params) : Truck.search(params)
      else
        @trucks = Truck.all
      end
      @trucks = @trucks.paginate(page: params[:page], per_page: 10)
    else
      respond_to do |format|
       format.html { redirect_to root_path }
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
         format.html { redirect_to trucks_path, success: 'Truck was successfully created, please check mail..!' }
        end
      else
        render "trucks/new"
      end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
    #   end
    end
  end
  def send_truck_booked_mail
    if params[:id].present?
     @truck = Truck.find_by_id(params[:id])
     @truck.update_attributes(:truck_booked =>true) if @truck.present?
     TruckBook.truck_booking_email(@truck.user).deliver if @truck.user.present?
     respond_to do |format|
       format.html { redirect_to :back, success: 'Truck successfully booked, please check mail..!' }
     end
    end
  end

  def truck_user_profile
    user = User.find_by_id(params[:user_id])
    @trucks = user.trucks if user.present?
  end

  def make_confirmation_truck
  end
  
  private
    def truck_params
			params.require(:truck).permit(:vehicle_number, :driver_name, :driver_mobile_no, :truck_weight, :truck_type, :schedule_date, :truck_from, :truck_to, :user_id, :truck_booked, :expected_price, :transit_time, :documentation,:sharing, :frequency)
    end
end
