class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :track_items
  has_many :favorites
  has_many :likes
  has_many :reviews
  has_many :companies, through: :favorites
  has_one_attached :photo
end
