class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authenticate_user!
  protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session
  add_flash_types :success, :danger, :info

  # before_action :check_confirmation_at


  # def check_confirmation_at
  #   if (current_user.nil? or current_user.confirmed_at.nil?)
  #     session["session_id"] = nil
  #   end
  # end
  # private
 
  #   def after_sign_in_path_for(resource)
  #     flash[:success]  = "Successfully Sign in."
  #     super
  #   end

  #   # Overwriting the sign_out redirect path method
  #   def after_sign_out_path_for(resource_or_scope)
  #     flash[:success]  = "Successfully Sign out."
  #     super
  #   end
end
