class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :track_items
  has_many :favorites
  has_many :likes
  has_many :reviews
  has_many :companies, through: :favorites
end
