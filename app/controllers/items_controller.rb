class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = set_item
  end

  def update
    @item = set_item

    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private 
  def item_params
  params.require(:item).permit(:name, :explanation, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to new_user_session_path
    end
   end

end
