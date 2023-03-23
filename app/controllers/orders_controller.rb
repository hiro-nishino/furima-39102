class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    
  end


  private
  def order_address_params
    params.require(:item).permit(:post_code, :prefecture_id, :city, :addresses, :building_name, :phone_number,).merge(user_id: current_user.id, item_id:@item.id)
  end
end