# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publication_year { Faker::Stripe.year}
    state { 'disponible' }
    isbn { Faker::Number.number(digits: 13) }
  end
end