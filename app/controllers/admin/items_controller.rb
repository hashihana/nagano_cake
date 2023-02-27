class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
    
  def index
    @item = Item.all
  end

  def show
  end
  
  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price)
  end
end
  

