class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_up_params, only: [:create]

  protected
   def after_sign_in_path_for(resource)
    if customer_signed_in?
        root_path
        # customer_path(current_customer)
    else
      admin_items_top_path
     
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      admin_session_path
    else root_path
    end
  end
  #def configure_sign_up_params
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:])
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end
