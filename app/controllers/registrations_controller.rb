class RegistrationsController < Devise::RegistrationsController
	private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :mobile_number,:address_line1,:address_line2,:address_pin_code,
    :address_country,:address_state,:address_city,:company_type,:company_pan_no, :company_gst_no, :other_detail_aadhaar_no,  :email, :password, :password_confirmation, :role_id)
  end

  def account_update_params
    params.require(:user)..permit(:first_name, :last_name, :mobile_number,:address_line1,:address_line2,:address_pin_code,
    :address_country,:address_state,:address_city,:company_type,:company_pan_no, :company_gst_no, :other_detail_aadhaar_no,  :email, :password, :password_confirmation, :role_id)
  end

  def after_sign_up_path_for(resource)
    '/users/sign_in'
    super
  end
end
