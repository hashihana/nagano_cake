class Public::ItemsController < ApplicationController
  
   
  def top
    @items = Item.all
    @random = Item.order("RANDOM()").limit(4)
  end
  
  def about
  end
  
  def index
      @items = Item.all.page(params[:page]).reverse_order
  end
  
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  	private
	def item_params
		parmas.require(:item).permit(:image ,:name )
	end

end

  
