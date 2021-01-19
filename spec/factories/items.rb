FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    explanation       { Faker::Name.name }
    category_id       { 2 }
    state_id          { 2 }
    burden_id         { 2 }
    area_id           { 2 }
    day_id            { 2 }
    price             { 900 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
