class Admin::CustomersController < ApplicationController
  
   def new
   end
  
  def index
    @customer = Customer.all
  end
 
  def show
      @customer = Customer.find(params[:id])  
  end
  
  def edit
		@customer = Customer.find(params[:id])
  end
  
end
