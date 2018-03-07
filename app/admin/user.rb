ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :password, :password_confirmation,:role_id,
:first_name,:last_name,:mobile_number,:address_line1,:address_line2,
:address_pin_code, :address_country,:address_state,:address_city,
:company_name,:company_type,:company_pan_no,:company_gst_no,:aadhaar_no_image
#
# or
#
config.filters = false
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role_id, :label => 'Load from', :as => :select, :collection => Role.where(:role_enabled=> true).collect{ |u| [u.name, u.id]}
      f.input :first_name
      f.input :last_name
      f.input :mobile_number
      f.input :address_line1
      f.input :address_line2
      f.input :address_pin_code
      f.input :address_country, as: :string
      f.input :address_state
      f.input :address_city
      f.input :company_name
     	f.input :company_type
      f.input :company_pan_no
      f.input :company_gst_no
      f.input :aadhaar_no_image
      actions
    end
  end
end
