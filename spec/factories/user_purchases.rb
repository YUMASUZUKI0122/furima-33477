FactoryBot.define do
  factory :user_purchase do
    
    postal_code   { 123-4567 }
    area_id       { 2 }
    city          { "横浜市港北区"}
    address       { 3-3-3 } 
    phone_number  { "09012345678"}
    token         {"tok_abcdefghijk00000000000000000"}
    item_id       { 2 }   
    user_id       { 1 }
  end
end
