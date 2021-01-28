class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]
  def index
    @user_purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
       redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])

    @user_purchase = UserPurchase.new(purchase_params)  
     if @user_purchase.valid?
      pay_item
       @user_purchase.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

 def purchase_params
  params.require(:user_purchase).permit(:postal_code, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], purchase_id: params[:pur],token: params[:token])
 end


 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],    
        currency: 'jpy'               
      )
 end

 def move_to_index
  @item = Item.find(params[:item_id])
  if @item.purchase.present? 
    redirect_to root_path
  end
 end
  
end
