class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
    
  def index
    @item = Item.page(params[:page])
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "投稿が成功しました"
      redirect_to admin_item_path
      else
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end


  def show
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price)
  end
end
  

