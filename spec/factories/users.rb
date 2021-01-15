FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"ゆうま"}
    last_name             {"すずき"}
    first_kananame        {"ユウマ"}
    last_kananame         {"スズキ"}
    birthday              {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end