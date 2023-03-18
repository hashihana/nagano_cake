class Admin::OrdersController < ApplicationController
  
   def index
    @orders = Order.all.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  def order_params
    params.require(:order).permit(:status)
  end
end
