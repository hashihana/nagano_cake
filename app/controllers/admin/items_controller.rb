class Admin::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
    
  def index
    @items = Item.all.page(params[:page]).per(10)
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
  
  def update
    @item = Item.find(params[:id])
    if item.update(item_params)
      flash[:notice] = "投稿の更新に成功しました"
    redirect_to admin_product_path(@product)
    else
      render "show"
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :genre_id, :introduction, :price)
  end
end


