class Company < ApplicationRecord
  has_many :stocks, :publications, :company_tags, :recommendations, :favorites, :reviews, :track_items
  has_many :tags, through: :company_tags
end
