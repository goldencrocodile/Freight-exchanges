ActiveAdmin.register Truck do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :vehicle_number, :driver_name, :driver_mobile_no, :truck_weight, 
:truck_type, :schedule_date, :truck_from, :truck_to, :truck_enabled,:user_id
# params.require(:truck).permit(:vehicle_number, :driver_name, :driver_mobile_no, :truck_weight, :truck_type, :schedule_date, :truck_from, :truck_to)
#
# or
#
config.filters = false
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
form do |f|
  f.inputs do
  	f.input :truck_from, label: "From", :as => :select, :collection => country_list.collect{ |u| [u] }
    f.input :truck_to, :label => 'To', :as => :select, :collection => country_list.collect{ |u| [u] }
    f.input :vehicle_number, :label => 'Vehicle Number'
    f.input :driver_name, :label => 'Driver Name'
    f.input :driver_mobile_no, :label => 'Driver Mobile Number'
    f.input :truck_weight, :label => 'Weight(Metric Ton)', :as => :select, :collection => Load::LOAD_WEIGHT.map {|k| [k.humanize.capitalize]}
    f.input :truck_type, :label => 'Truck Type', :as => :select, :collection => Load::LOAD_TRUCK_TYPE.map {|k| [k.humanize.capitalize]}
    f.input :schedule_date, :label => 'Scheduled Date'
  	f.input :truck_enabled, :label => 'Truck enabled', :as => :check_boxes
  	f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map {|k,v| [k.email, k.id]}
  	actions
  end
end

end
