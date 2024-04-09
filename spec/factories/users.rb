# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'John' }
    last_name { 'Doe' }
    email { 'john@email_provider.com' }
    cellphone { '1234567890' }
    password { '123456789' }
    address { 'cll15#123' }
  end
end