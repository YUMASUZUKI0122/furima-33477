require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
end

describe '商品出品' do

  context '商品出品ができるとき' do
    it "name、explanation、category_id、state_id、burden_id、area_id、day_id、price、imageが存在すれば登録できる" do
      expect(@item).to be_valid
    end
  end
 
  context '商品出品ができないとき' do
    it "nameが空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空では登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "category_idが1では登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "state_idが1では登録できない" do
      @item.state_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end
    it "burden_idが1では登録できない" do
      @item.burden_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end
    it "area_idが1では登録できない" do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "day_idが1では登録できない" do
      @item.day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "imageが空では登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "priceは全角数字では登録できない" do
      @item.price= "５５５"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Price Out of setting range", "Price Half-width number")
    end
    it "priceは半角英語では登録できない" do
      @item.price= "aaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Price Out of setting range", "Price Half-width number")
    end
    it "priceは300以上でなければ登録できない" do
      @item.price= "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Price Out of setting range")
    end
    it "priceは9999999以下でなければ登録できない" do
      @item.price= "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Price Out of setting range")
    end
    it 'userが紐付いていないと登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end