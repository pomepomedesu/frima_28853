FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"加藤"}
    last_name             {"海土"}
    first_name_kana       {"カトウ"}
    last_name_kana        {"カイト"}
    birth_day             {"1999-07-03"}
  end
end