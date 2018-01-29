class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :authenticate_user!
  protect_from_forgery with: :exception
  add_flash_types :success, :danger, :info
  private
 
    def after_sign_in_path_for(resource)
      flash[:success]  = "Successfully Sign in."
      super
    end

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      flash[:success]  = "Successfully Sign out."
      super
    end
end
