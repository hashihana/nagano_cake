class Public::OrdersController < ApplicationController

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(6).order('created_at DESC')
  end

  def new
    @order = Order.new
    @customer = current_customer
    @address = current_customer.addresses
  end

 def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if @order.save!
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.item_id = cart_item.item_id
        order_detail.save!
      end
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      render "new"
    end
  end

  def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details.all
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_payment = params[:order][:total_payment]
    @total_price = current_customer.cart_items.cart_items_total_price(@cart_items)
    @order.shipping_cost = 800

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + " " + current_customer.first_name
      render 'confirm'
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      render 'confirm'
    elsif params[:order][:address_option] == "2"
      @address = current_customer.address.new
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postal_code = params[:order][:postal_code]
      @saddress.customer_id = current_customer.id
      if @address.save
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.address
      else
       render 'new'
      end
    end
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping, :total_payment)
  end

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end
end
