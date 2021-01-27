class UserPurchase
  include ActiveModel::Model
  attr_accessor  :postal_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token

  with_options presence: true do
   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
   validates :area_id, numericality: { other_than: 1, message:'Select' }
   validates :city
   validates :address
   validates :phone_number,numericality:{ with: /\A[0-9]+\z/, message: 'Input only number' }
   validates :token
  end

  def save
    # binding.pry
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Delivery.create!(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end



