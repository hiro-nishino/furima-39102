class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_find
  before_action :move_to_index
  def index
    @order_address = OrderAddress.new
    redirect_to new_card_path and return unless card.present?
    if @item.user_id == current_user.id || @item.order
      redirect_to root_path 
    end
  end
  
  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :addresses, :building_name, :phone_number,).merge(user_id: current_user.id, item_id:@item.id, token: params[:token])
  end

  def set_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     customer_token = current_user.card.customer_token
      Payjp::Charge.create(
        amount: @item[:price],
        customer: customer_token,
        #card: order_params[:token],
        currency: 'jpy'
      )
   end
   def move_to_index
    if  current_user.id == @item.user_id  || @item.order.present?
      redirect_to root_path
    end
  end
end