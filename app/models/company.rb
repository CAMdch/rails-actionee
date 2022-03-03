class Company < ApplicationRecord
  geocoded_by :headquarter_city
  after_validation :geocode, if: :will_save_change_to_headquarter_city?

  has_many :stocks
  has_many :publications
  has_many :company_tags, dependent: :destroy
  has_many :recommendations
  has_many :favorites, dependent: :destroy
  has_many :reviews
  has_many :track_items
  has_many :tags, through: :company_tags
end
