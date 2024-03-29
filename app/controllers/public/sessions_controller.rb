# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
before_action :customer_state, only: [:create]

protected

def customer_state
   @customer = Customer.find_by(email: params[:customer][:email])
   puts 'test1'
    return if !@customer
    puts 'test2'
     #if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == true))
     if (@customer.valid_password?(params[:customer][:password]) )
       puts 'test3'
       if @customer.is_deleted == true
         puts 'test4'
        flash[:alert] = "このアカウントは退会済みです。"
        redirect_to new_customer_session_path
       end
     end
end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
