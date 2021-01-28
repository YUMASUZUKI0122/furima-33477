FactoryBot.define do
  factory :user_purchase do
    
    postal_code   { 123-4567 }
    area_id       { 2 }
    city          { "横浜市港北区"}
    address       { 3-3-3 } 
    phone_number  { Faker::PhoneNumber }
    token         {"tok_abcdefghijk00000000000000000"}
    
  end
end
