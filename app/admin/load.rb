ActiveAdmin.register Load do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date, :load_type, :source_pin_code,:destination_pin_code, :load_enabled
#params.require(:load).permit(:load_from, :load_to, :load_material, :load_weight, :load_truck_type, :load_no_of_truck, :load_schedule_date, :load_type, :source_pin_code,:destination_pin_code)
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
def booked(load)
	if load.booked == true
	end
end

end
