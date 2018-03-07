ActiveAdmin.register Load do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck,
 :load_schedule_date, :load_type, :source_pin_code,:destination_pin_code, :load_enabled,:user_id
#params.require(:load).permit(:load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date, :load_type, :source_pin_code,:destination_pin_code)
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
form do |f|
  f.inputs do
    f.input :load_from, :label => 'Load from', :as => :select, :collection => country_list.collect{ |u| [u] }
    f.input :load_to, :label => 'Load to', :as => :select, :collection => country_list.collect{ |u| [u] }
    f.input :load_material, :label => 'Material', :as => :select, :collection => Load::LOAD_MATERIAL.map {|k| [k.humanize.capitalize]}
    f.input :load_weight, :label => 'Weight(Metric Ton)', :as => :select, :collection => Load::LOAD_WEIGHT.map {|k| [k.humanize.capitalize]}
    f.input :load_truck_type, :label => 'Truck Type', :as => :select, :collection => Load::LOAD_TRUCK_TYPE.map {|k| [k.humanize.capitalize]}
    f.input :load_no_of_truck, :label => 'No. of Truck', :as => :select, :collection => Load::NO_OF_TRUCKS.map {|k| [k.humanize.capitalize]}
    f.input :load_schedule_date, label: "Scheduled Date"
    f.input :load_type, :label => 'Truck Type', :as => :select, :collection => Load::LOAD_TRUCK_TYPE.map {|k| [k.humanize.capitalize]}
  	f.input :source_pin_code, label: "Source pin code"
  	f.input :destination_pin_code, label: "Destination pin code"
  	f.input :load_enabled, :label => 'Load enabled', :as => :check_boxes
  	f.input :user_id, :label => 'User', :as => :select, :collection => User.all.map {|k,v| [k.email, k.id]}
  	actions
  end
end
def booked(load)
	if load.booked == true
	end
end
config.filters = false
end
