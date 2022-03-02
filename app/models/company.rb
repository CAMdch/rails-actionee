class Company < ApplicationRecord
  has_many :stocks
  has_many :publications
  has_many :company_tags, dependent: :destroy
  has_many :recommendations
  has_many :favorites
  has_many :reviews
  has_many :track_items
  has_many :tags, through: :company_tags
end
