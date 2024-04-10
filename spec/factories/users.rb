# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    cellphone { Faker::PhoneNumber.phone_number_with_country_code }
    password { Faker::Internet.password(min_length: 8) }
    address { Faker::Address.full_address }
  end
end