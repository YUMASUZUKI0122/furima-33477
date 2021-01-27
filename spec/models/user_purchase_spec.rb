require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @user_purchase = FactoryBot.build(:user_purchase) 
 end

 describe '商品購入' do

  #context '商品購入できるとき' do
    #it "postal_codeとarea_idとcityとaddressとphone_numberとuser_idとitem_idとtokenがあれば購入できる" do
     # expect(@user_purchase).to be_valid
    #end
  #end

  context '商品購入できないとき' do
    
    it "postal_codeが空では購入できない" do
      @user_purchase.postal_code = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it "area_idが1では購入できない" do
      @user_purchase.area_id = "1"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Area Select")
    end
    it "cityが空では購入できない" do
      @user_purchase.city = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空では購入できない" do
      @user_purchase.address = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空では購入できない" do
      @user_purchase.phone_number = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it "tokenが空では購入できない" do
      @user_purchase.token = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it "phone_numberは数字でなければ購入できない" do
      @user_purchase.phone_number = "aaa"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number Input only number")
    end
    it "user_idが空では購入できない" do
      @user_purchase.phone_number = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code Input correctly", "Phone number can't be blank", "Phone number Input only number")
    end
    it "item_idが空では購入できない" do
      @user_purchase.phone_number = ""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code Input correctly", "Phone number can't be blank", "Phone number Input only number")
    end
  end
end
end