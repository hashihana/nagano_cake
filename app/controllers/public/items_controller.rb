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

end
  
