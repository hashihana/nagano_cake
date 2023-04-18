class Public::CustomersController < ApplicationController

    before_action :authenticate_customer!

    def edit
        @customer = current_customer
    end

    def update
        @customer = current_customer
        if @customer.update(customer_params)
        flash[:update] = "You have updated user info successfully."
        redirect_to customer_path(@customer.id)
        else
        render 'edit'
        end
    end

    def show
        @customer = current_customer
    end

    def confirm_withdraw
        @customer = current_customer
        #ユーザーの情報を見つける

    end
    
    # def quit
    #     @customer = current_customer
        

    # end


    def withdraw
        @customer = Customer.find(current_customer.id)
        @customer.update(is_deleted: false)
        reset_session
        flash[:notice] = "Thank you for the good rating. We hope to see you again."
        redirect_to root_path
    end


    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name,
                                        :last_name_kana, :first_name_kana,
                                        :email, :postal_code, :address, :telephone_number)
    end

end
