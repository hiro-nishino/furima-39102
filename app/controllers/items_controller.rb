class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def show
  end

  def edit
    if @item.order.present?
      redirect_to action: :index
    elsif current_user.id != @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
   if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    else
      render "index"
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

    private

    def item_params
      params.require(:item).permit(:name, :detail, :item_category_id, :item_condition_id, :shipping_charge_id, :prefecture_id, :days_to_ship_id, :price, {images: []}).merge(user_id: current_user.id)
    end

  def move_to_index 
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
 end  
