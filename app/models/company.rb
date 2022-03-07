class Company < ApplicationRecord
  geocoded_by :headquarter_city
  after_validation :geocode, if: :will_save_change_to_headquarter_city?


  has_many :stocks
  has_many :publications
  has_many :company_tags, dependent: :destroy
  has_many :recommendations
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :track_items, dependent: :destroy
  has_many :tags, through: :company_tags

  def self.filter_tag(filter_params)
    companies = []
    filter_params.each_key do |key|
      tag_id = Tag.find_by(name: key).id
      Company.all.each do |company|
        if company.tags.any? { |tag| tag.id == tag_id}
          companies << company
        end
      end
    end
    return companies.uniq
  end
end
