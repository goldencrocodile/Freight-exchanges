class LoadsController < ApplicationController
  require 'will_paginate/array'
  respond_to :html, :json, :js
  before_filter :authenticate_user!
  def index
    if current_user.present? and current_user.role.name=="Truck Owner"
      if (params[:load_from].present? or params[:load_to].present? or params[:load_material].present? or params[:load_schedule_date].present? or params[:load_truck_type].present?)
        @loads = params[:load_schedule_date].present? ? Load.where('load_schedule_date = ?',params[:load_schedule_date]).search(params) : Load.search(params)
        @trucks = params[:load_schedule_date].present? ? current_user.trucks.where('schedule_date = ?',params[:load_schedule_date]) : current_user.trucks.find(:all, :conditions=>["truck_from LIKE ? AND truck_to LIKE ? AND truck_type LIKE ?", "%#{params[:load_from]}%","%#{params[:load_to]}%", "%#{params[:load_truck_type]}%"])
      else
        @loads = Load.all
        @trucks = params[:load_schedule_date].present? ? current_user.trucks.where('schedule_date = ?',params[:load_schedule_date]) : current_user.trucks.find(:all, :conditions=>["truck_from LIKE ? AND truck_to LIKE ? AND truck_type LIKE ?", "%#{params[:load_from]}%","%#{params[:load_to]}%", "%#{params[:load_truck_type]}%"])
      end
      @loads = @loads.paginate(page: params[:page], per_page: 10)
    else
      respond_to do |format|
        format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
      end
    end 
  end
	def new
    if current_user.role.name == "Load Provider" and current_user.present?
  	 @load =Load.new
    else
      respond_to do |format|
        format.html { redirect_to root_path, success: 'You are not authorised for this service!' }
      end
    end
  end
  def create
    user = current_user if user_signed_in?
    @load =user.loads.build(load_params)
  	 if @load.save
      CreateLoad.load_user(@load).deliver
      ###  call deliver method after save send email ###
      respond_to do |format|
       format.html { redirect_to root_path, success: 'Load was successfully created.' }
     end
      else
        render "loads/new"
      end
  end

  def distance_calculation
    if  params[:distance_from].present? and params[:distance_to].present?
      @response = HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{params[:distance_from]}&destinations=#{params[:distance_to]}+BC&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      @source_lat_long = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:distance_from]}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      @destination_lat_long = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:distance_to]}&key=AIzaSyAlvMtnmGT7_fFtVgvKtDMG5tYuIX2Rdig", :verify => false)
      @source_lat_long = @source_lat_long["results"][0]["geometry"]["location"]
      @destination_lat_long = @destination_lat_long["results"][0]["geometry"]["location"]
        respond_to do |format|  ## Add this
          format.js
          format.html
        end  
    end
  end

  def send_booked_mail
    if params[:id].present? and params[:truck_id].present?
     @load = Load.find_by_id(params[:id])
     @truck = Truck.find_by_id(params[:truck_id])
     @load.update_attributes(:booked => "requesting") if @load.present?
    Ordermailer.booking_email(@truck,@load).deliver! if @load.present?
    TruckBook.truck_booking_email(@truck, @load).deliver! if @load.present?
     respond_to do |format|
       format.html { redirect_to root_path, success: 'You have requested to load provider..! ' }
     end
    end
  end
  def root_direction
  end

  def load_user_profile
    user = User.find_by_id(params[:user_id])
    @loads = user.loads if user.present?
  end

  def make_confirmation_load
    @load = Load.find_by_id(params[:load_id])
  end
  def load_status
    if params[:load_id].present?
      load = Load.find_by_id(params[:load_id])
      if params[:result] == "accept"
        load.update_attributes(:booked=> "accept_request")
        respond_to do |format|
        format.html { redirect_to payment_data_path(:load_id=>load.id,:user_id=>current_user.id), success: "Load status has #{load.booked}!" }
      end
      elsif  params[:result] == "barganning"
        load.update_attributes(:booked=> "barganning")
        respond_to do |format|
        format.html { redirect_to root_path, success: "Load status has #{load.booked}!" }
      end
      else
        load.update_attributes(:booked=> "request")
        respond_to do |format|
        format.html { redirect_to root_path, success: "Load status has #{load.booked}!" }
      end
      end
    end
  end
   private
    def load_params
      params.require(:load).permit(:load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date, :load_type, :source_pin_code,:destination_pin_code, :load_enabled, :user_id, :booked, :sharing_load, :expected_price, :information, :load_body)
    end
end