class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :last_name, presence: true
  validates :cellphone, presence: true, length: { minimum: 10 }
  validates :address, presence: true
  validates :email, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
