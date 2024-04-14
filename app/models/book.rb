class Book < ApplicationRecord
  validates :title, :author, :publication_year, :isbn, presence: true
  validates :isbn, uniqueness: true
  has_many :loans
  has_many :users, through: :loans
end
