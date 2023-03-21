class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
    
    private
    def item_params
      params.require(:item).permit(:name, :detail, :item_category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price, {images: []}).merge(user_id: current_user.id)
    end
  end
end

