class Book < ApplicationRecord
  validates :title, :author, :publication_year, :isbn, presence: true
  validates :isbn, uniqueness: true
end
