# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'Las formas del querer' }
    author { 'INES MARTIN RODRIGO' }
    publication_year { 2022 }
    state { 'disponible' }
    isbn { '9788423360895' }
  end
end