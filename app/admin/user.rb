ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :password, :password_confirmation,:role_id,:first_name,:last_name,:mobile_number,:address_line1,:address_line2,:address_pin_code,:address_pin_code,:address_country,:address_state,:address_city,:company_name,:company_type,:company_pan_no,:company_gst_no,:other_detail_aadhaar_no
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form title: 'A custom title' do |f|
    inputs 'User' do
      input :email
      input :password
      input :password_confirmation
      input :role_id
      input :first_name
      input :last_name
      input :mobile_number
      input :address_line1
      input :address_line2
      input :address_pin_code
      input :address_country
      input :address_state
      input :address_city
      input :company_name
     	input :company_type
      input :company_pan_no
      input :company_gst_no
     input :other_detail_aadhaar_no
    actions
    end
  end
end
